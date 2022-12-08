import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/providers/events.provider.dart';
import 'package:alumni_hub/widgets/event.tile.dart';
import 'package:alumni_hub/widgets/top.events.tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventData>(builder: (context, eventData, _) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text('More Events'),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: eventData.eventList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return TopEventTile(eventModel: eventData.eventList[index]);
            },
          ));
    });
  }
}
