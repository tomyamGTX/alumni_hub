import 'package:alumni_hub/models/events.model.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/events.provider.dart';
import '../views/video.dart';

class EventTile extends StatefulWidget {
  final EventModel eventModel;
  const EventTile({
    required this.eventModel,
    Key? key,
  }) : super(key: key);

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String name = await Provider.of<EventData>(context, listen: false)
            .getAuthor(widget.eventModel.userId!);
        if (!mounted) return;
        Navigator.push(
            context,
            RouteAnimate(
                builder: (context) => VideoScreen(
                      eventModel: widget.eventModel,
                      author: name,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
          height: 120,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.eventModel.eventPicUrl ??
                      'https://www.specialevents.com/sites/specialevents.com/files/styles/article_featured_retina/public/gallery_promo_image/InVision_Shaklee_Global_Live.jpg?itok=huOoiSZJ'))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(widget.eventModel.eventName ?? 'Career Path',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    fontSize: 20.0,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5,
                  )),
            ),
          )),
    );
  }
}
