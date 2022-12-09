import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? eventId;
  String? eventName;
  DateTime? eventDate;
  String? eventPicUrl;
  String? eventVideoUrl;
  int? eventLikes;
  String? userId;
  EventModel.fromJson(Map<String, dynamic> map) {
    Timestamp time = map['eventDate'];

    eventId = map['eventId'];
    eventName = map['eventName'];
    eventDate = time.toDate();
    eventPicUrl = map['eventPicUrl'];
    eventLikes = map['eventLikes'];
    eventVideoUrl = map['eventVideoUrl'];
    userId = map['userId'];
  }

  toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "eventDate": eventDate,
        "eventPicUrl": eventPicUrl,
        "eventLikes": eventLikes,
        "eventVideoUrl": eventVideoUrl,
        "userId": userId
      };
}
