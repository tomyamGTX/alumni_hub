import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String? url = "https://www.youtube.com/watch?v=A-BvytZDdSw&t";
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
    var id = _getYoutubeVideoIdByURL(url!);
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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text('Event Name'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.star_border))
            ],
          ),
          body: Column(
            children: [
              player,
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Video Description',
                  style: GoogleFonts.roboto(fontSize: 40),
                ),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
