import 'package:alumni_hub/models/events.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EventData extends ChangeNotifier {
  var author;

  factory EventData() => EventData._();
  List<EventModel> eventList = [];
  int limit = 6;
  EventData._() {
    getEvents();
  }

  Future<void> getEvents() async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .orderBy('eventDate')
          .limit(limit)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>?;
          eventList.add(EventModel.fromJson(data!));
          notifyListeners();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  getAuthor(String id) async {
    var name;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((value) {
      name = value['userName'];
    });
    return name;
  }
}
