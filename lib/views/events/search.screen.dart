import 'dart:math';

import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/models/events.model.dart';
import 'package:alumni_hub/providers/events.provider.dart';
import 'package:alumni_hub/views/events/home.screen.dart';
import 'package:alumni_hub/views/events/video.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:alumni_hub/widgets/top.events.tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<EventModel> filterList = [];
  bool isSearch = false;
  final _search = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventData>(builder: (context, eventData, _) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.push(
                    context, RouteAnimate(builder: (context) => HomeScreen()));
              },
            ),
            title: TextField(
              controller: _search,
              onChanged: (v) {
                setState(() {
                  isSearch = true;
                });
                List<EventModel> data = eventData.eventList;
                data.forEach((element) {
                  if (element.eventName!
                      .toLowerCase()
                      .contains(v.toLowerCase())) {
                    if (kDebugMode) {
                      print('found list');
                    }
                    setState(() {
                      if (filterList.contains(element)) {
                      } else {
                        filterList.add(element);
                      }
                    });
                  } else {
                    setState(() {
                      filterList.clear();
                    });
                  }
                });
              },
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _search.clear();
                        isSearch = false;
                      });
                    },
                  ),
                  border: InputBorder.none,
                  hintText: 'Type to search ...',
                  hintStyle:
                      GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: ListView.builder(
            itemCount:
                isSearch ? filterList.length : eventData.eventList.length,
            itemBuilder: (BuildContext context, int index) {
              var item =
                  isSearch ? filterList[index] : eventData.eventList[index];
              return ListTile(onTap:() => Navigator.push(context, RouteAnimate(builder: (context)=>VideoScreen(eventModel: item))),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.eventPicUrl!),
                ),
                title: Text(item.eventName!),
                subtitle: Text('${item.eventLikes} Likes'),
                trailing: const Icon(Icons.navigate_next),
              );
            },
          ));
    });
  }
}
