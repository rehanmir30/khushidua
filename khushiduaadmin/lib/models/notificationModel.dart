class NotificationModel{

  String id="";
  String title="";
  String message="";
  DateTime createdAt=DateTime.now();
  String? sentTo;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.sentTo
});

  factory NotificationModel.fromMap(Map<String,dynamic>map){
    return NotificationModel(
      id: map["id"],
      title: map["title"],
      message: map["message"],
      createdAt: map["createdAt"].toDate(),
      sentTo: map["sentTo"]
    );
  }
  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "title":title,
      "message":message,
      "createdAt":createdAt,
    };
  }
}