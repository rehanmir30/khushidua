import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/constants/firebaseRef.dart';
import 'package:khushiduaadmin/controllers/userController.dart';
import 'package:khushiduaadmin/models/userModel.dart';

class UserService{
  UserController _userController=Get.find<UserController>();

  getAllUsers(){
    userRef.snapshots().listen((event) {
      event.docChanges.forEach((element) {
        if(element.type==DocumentChangeType.added||element.type==DocumentChangeType.modified){
          _userController.addUserToList(UserModel.fromMap(element.doc.data()!));
        }
      });
    });
  }
}