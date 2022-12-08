import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel {
  String? conversationId;
  DateTime? conversationDate;
  String? userId;
  String? conversationList;

  ConversationModel(
      {required this.userId,
      required this.conversationId,
      required this.conversationDate,
      required this.conversationList});

  ///get data from db and convert to object
  ConversationModel.fromJson(Map<String, dynamic> map) {
    Timestamp time = map['conversationDate'];
    DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    conversationId = map['conversationId'];
    conversationDate = time.toDate();
    userId = map['userId'];
    conversationList = map['conversationList'];
  }

  ///convert object to map and upload to db
  toJson() => {
        "conversationId": conversationId,
        "conversationDate": conversationDate,
        "userId": userId,
        "conversationList": conversationList
      };
}
