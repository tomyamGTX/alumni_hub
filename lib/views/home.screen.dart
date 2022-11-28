import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/views/chatbot.screen.dart';
import 'package:alumni_hub/views/favourite.screen.dart';
import 'package:alumni_hub/views/search.screen.dart';
import 'package:alumni_hub/views/setting.screen.dart';
import 'package:alumni_hub/widgets/event.tile.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:alumni_hub/widgets/top.events.tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: const Drawer(),
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

  Widget buildEvents() => SizedBox(
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
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return EventTile(
                    index: index,
                  );
                },
              ))
            ]),
      );

  Widget buildTopEvents() => SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Top Events',
              style: titleStyle,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 24),
          Flexible(
              child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return TopEventTile(
                index: index,
              );
            },
          ))
        ]),
      );

  Widget buildChatBot() => Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 54),
              shape: StadiumBorder(
                  side: BorderSide(color: kPrimaryColor, width: 2))),
          onPressed: () => Navigator.push(
              context, RouteAnimate(builder: (context) => ChatBotScreen())),
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
