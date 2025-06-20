import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:khushidua/constants/firebaseRef.dart';
import 'package:khushidua/controllers/notificationController.dart';
import 'package:khushidua/controllers/userController.dart';

import '../models/notificationModel.dart';

class NotificationService {
  NotificationController _notificationController = Get.find<NotificationController>();
  UserController _userController = Get.find<UserController>();

  void getAllNotifications() {
    // ✅ Global notifications
    notificationRef.where('sentTo', isNull: true).snapshots().listen((event) {
      event.docChanges.forEach((element) {
        if (element.type == DocumentChangeType.added ||
            element.type == DocumentChangeType.modified) {
          _notificationController.addNotificationToList(
              NotificationModel.fromMap(element.doc.data()!));
        }
      });
    });

    // ✅ User-specific notifications
    final user = _userController.userModel;
    if (user != null) {
      print("if called");
      notificationRef
          .where('sentTo', isEqualTo: user.id)
          .snapshots()
          .listen((event) {
        print("funct called");
        event.docChanges.forEach((element) {
          if (element.type == DocumentChangeType.added ||
              element.type == DocumentChangeType.modified) {
            _notificationController.addNotificationToList(
                NotificationModel.fromMap(element.doc.data()!));
          }
        });
      });
    }
  }
}
