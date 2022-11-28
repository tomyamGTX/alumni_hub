import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  int _length = 1;

  var _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: kPrimaryColor,
            title: const Text('Chat with Alumni Bot')),
        body: SingleChildScrollView(
          controller: _scroll,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Center(
                    child: Text(
                  DateFormat.Hm().format(DateTime.now()),
                  style: GoogleFonts.roboto(fontSize: 20),
                )),
              ),
              for (int i = 0; i < _length; i++) ...[
                buildUserBubble(i),
                buildBotBubble(i),
              ]
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RawChip(
                    onPressed: () {
                      setState(() {
                        _length++;
                      });
                      _scroll.animateTo(
                          _length * MediaQuery.of(context).size.height * 0.3,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    backgroundColor: kPrimaryColor,
                    label: Text(
                      'Option ${i + 1}',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }

  Widget buildBotBubble(int index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 30,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/4944/4944377.png'),
            ),
          ),
          Flexible(
            child: ChatBubble(
              clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              backGroundColor: Colors.grey,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet $index",
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      );
  Widget buildUserBubble(int index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 30),
          Flexible(
            child: ChatBubble(
              clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              backGroundColor: kPrimaryColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet.$index",
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 30,
              backgroundImage: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-512.png'),
            ),
          ),
        ],
      );
}
