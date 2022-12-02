import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/video.dart';

class EventTile extends StatelessWidget {
  final int index;
  const EventTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, RouteAnimate(builder: (context) => const VideoScreen())),
      child: Container(
          margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
          height: 120,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.specialevents.com/sites/specialevents.com/files/styles/article_featured_retina/public/gallery_promo_image/InVision_Shaklee_Global_Live.jpg?itok=huOoiSZJ'))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Career Path',
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
