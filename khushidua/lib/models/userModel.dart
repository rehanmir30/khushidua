class UserModel {
  String id = "";
  String name = "";
  String email = "";
  bool isLoggedIn = false;
  int points = 0;
  List<String> readDuas = [];
  bool isMember = false;
  bool isBlocked=false;
  String fcmToken="";
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.points,
      required this.isLoggedIn,
      required this.isMember,
        required this.isBlocked,
      required this.readDuas,
      required this.createdAt,
      required this.updatedAt,
      required this.fcmToken});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["id"],
        name: map["name"],
        email: map["email"],
        points: map["points"],
        isLoggedIn: map["isLoggedIn"],
        isMember: map["isMember"],
        isBlocked: map["isBlocked"],
        readDuas: List<String>.from(map["readDuas"] ?? []),
        createdAt: map["createdAt"].toDate(),
        updatedAt: map["updatedAt"].toDate(),
    fcmToken: map["fcmToken"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "points": points,
      "isLoggedIn": isLoggedIn,
      "isMember": isMember,
      "isBlocked":isBlocked,
      "readDuas": readDuas,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "fcmToken":fcmToken
    };
  }
}
