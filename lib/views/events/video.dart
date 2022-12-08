import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/models/events.model.dart';
import 'package:alumni_hub/providers/events.provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatefulWidget {
  final EventModel eventModel;
  final String? author;
  const VideoScreen({super.key, required this.eventModel, this.author});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String? _getYoutubeVideoIdByURL(String url) {
    final regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false);

    try {
      if (regex.hasMatch(url)) {
        return regex.firstMatch(url)!.group(1);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  late bool autoPlay;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    autoPlay = false;

    var id = _getYoutubeVideoIdByURL(widget.eventModel.eventVideoUrl!);
    _controller = YoutubePlayerController()
      ..onInit = () {
        if (autoPlay) {
          _controller.loadVideoById(videoId: id!, startSeconds: 0);
        } else {
          _controller.cueVideoById(videoId: id!, startSeconds: 0);
        }
      };
    super.initState();
  }

  @override
  void dispose() {
    _controller.stopVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Consumer<EventData>(builder: (context, eventData, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Text(widget.eventModel.eventName!),
              actions: [
                IconButton(
                    onPressed: userAction, icon: const Icon(Icons.star_border)),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text('${widget.eventModel.eventLikes}',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Video Description',
                          style: GoogleFonts.roboto(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Author: ${widget.author ?? 'Anonymous'}',
                          style: GoogleFonts.roboto(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Date Published: ${DateFormat.yMMMd().format(widget.eventModel.eventDate!)}',
                          style: GoogleFonts.roboto(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void userAction() {
    //check user like or not
    //update like for video and user collection
  }
}
