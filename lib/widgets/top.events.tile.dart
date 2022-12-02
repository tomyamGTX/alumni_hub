import 'package:alumni_hub/views/video.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopEventTile extends StatelessWidget {
  final int index;
  const TopEventTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 186,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () => Navigator.push(context,
                RouteAnimate(builder: (context) => const VideoScreen())),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.specialevents.com/sites/specialevents.com/files/styles/article_featured_retina/public/gallery_promo_image/InVision_Shaklee_Global_Live.jpg?itok=huOoiSZJ'))),
            ),
          ),
          Card(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            elevation: 2,
            child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              isThreeLine: true,
              tileColor: Colors.white,
              title: Text('Life Lesson',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.5,
                  )),
              subtitle: Text('Kuala Lumpur\nDr. Raihah',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
