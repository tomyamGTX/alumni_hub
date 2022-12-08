import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/models/events.model.dart';
import 'package:alumni_hub/providers/events.provider.dart';
import 'package:alumni_hub/views/chatbot.screen.dart';
import 'package:alumni_hub/views/events/more.screen.dart';
import 'package:alumni_hub/views/favourite.screen.dart';
import 'package:alumni_hub/views/events/search.screen.dart';
import 'package:alumni_hub/views/setting.screen.dart';
import 'package:alumni_hub/widgets/event.tile.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:alumni_hub/widgets/top.events.tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/app.drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get _eventsStream => FirebaseFirestore.instance
      .collection('events')
      .orderBy('eventLikes')
      .limit(6)
      .snapshots();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Discover',
            style: GoogleFonts.roboto(),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    RouteAnimate(builder: (context) => const SearchScreen())),
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    RouteAnimate(
                        builder: (context) => const FavouriteScreen())),
                icon: const Icon(Icons.favorite)),
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      RouteAnimate(
                          builder: (context) => const SettingScreen())),
                  icon: const Icon(Icons.more_vert));
            })
          ],
          backgroundColor: kPrimaryColor,
        ),
        drawer: const AppDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, bottom: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildEvents(),
                const SizedBox(height: 32),
                buildTopEvents(),
                const Spacer(),
                buildChatBot(),
              ],
            ),
          ),
        ));
  }

  Widget buildEvents() => Consumer<EventData>(builder: (context, eventData, _) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.26,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Events',
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                    child: ListView.builder(
                  itemCount: eventData.eventList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var data = eventData.eventList[index];
                    return EventTile(eventModel: data);
                  },
                ))
              ]),
        );
      });

  Widget buildTopEvents() => StreamBuilder<QuerySnapshot>(
      stream: _eventsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  'Top Events',
                  style: titleStyle,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      RouteAnimate(builder: (context) => const MoreScreen())),
                  child: const Text(
                    'MORE',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(height: 24),
            Flexible(
                child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data!.docs[index];
                var map = data.data() as Map<String, dynamic>;

                return TopEventTile(
                  eventModel: EventModel.fromJson(map),
                );
              },
            ))
          ]),
        );
      });

  Widget buildChatBot() => Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 54),
              shape: StadiumBorder(
                  side: BorderSide(color: kPrimaryColor, width: 2))),
          onPressed: () => Navigator.push(context,
              RouteAnimate(builder: (context) => const ChatBotScreen())),
          child: Text(
            'CHAT WITH ALUMNI BOT',
            style: GoogleFonts.roboto(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
}
