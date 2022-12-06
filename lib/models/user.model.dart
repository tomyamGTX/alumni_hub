class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPicUrl;

  UserModel(
      {required this.userEmail,
      required this.userId,
      required this.userName,
      required this.userPicUrl});

  ///get data from db and convert to object
  UserModel.fromJson(map) {
    userId = map['userId'];
    userName = map['userName'];
    userEmail = map['userEmail'];
    userPicUrl = map['userPicUrl'];
  }

  ///convert object to map and upload to db
  toJson() => {
        "userId": userId,
        "userName": userName,
        "userEmail": userEmail,
        "userPicurl": userPicUrl
      };
}
