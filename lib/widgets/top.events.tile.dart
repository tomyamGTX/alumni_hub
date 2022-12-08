import 'package:alumni_hub/models/events.model.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/events.provider.dart';
import '../views/events/video.dart';

class TopEventTile extends StatefulWidget {
  final EventModel eventModel;

  const TopEventTile({
    required this.eventModel,
    Key? key,
  }) : super(key: key);

  @override
  State<TopEventTile> createState() => _TopEventTileState();
}

class _TopEventTileState extends State<TopEventTile> {
  var name;
  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 186,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                RouteAnimate(
                    builder: (context) => VideoScreen(
                          eventModel: widget.eventModel,
                          author: name ?? 'Anonymous',
                        ))),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.eventModel.eventPicUrl ??
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
              title: Text(widget.eventModel.eventName!,
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
              subtitle: Text('Kuala Lumpur\n${name ?? 'Anonymous'}',
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

  Future<void> getName() async {
    name = await Provider.of<EventData>(context, listen: false)
        .getAuthor(widget.eventModel.userId!);
    if (mounted) setState(() {});
  }
}
