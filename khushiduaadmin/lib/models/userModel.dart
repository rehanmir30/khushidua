class UserModel {
  String id = "";
  String name = "";
  String email = "";
  bool isLoggedIn = false;
  int points = 0;
  String fcmToken="";
  List<String> readDuas = [];
  bool isMember = false;
  bool isBlocked=false;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.points,
        required this.fcmToken,
      required this.isLoggedIn,
      required this.isMember,
        required this.isBlocked,
      required this.readDuas,
      required this.createdAt,
      required this.updatedAt});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["id"],
        name: map["name"],
        email: map["email"],
        points: map["points"],
        fcmToken: map["fcmToken"],
        isLoggedIn: map["isLoggedIn"],
        isMember: map["isMember"],
        isBlocked: map["isBlocked"],
        readDuas: List<String>.from(map["readDuas"] ?? []),
        createdAt: map["createdAt"].toDate(),
        updatedAt: map["updatedAt"].toDate());
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
