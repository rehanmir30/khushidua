import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khushiduaadmin/controllers/initController.dart';
import 'package:khushiduaadmin/views/auth/login.dart';
import 'package:khushiduaadmin/views/dashboard.dart';
import 'package:khushiduaadmin/views/delayLoading.dart';
import 'firebase_options.dart';
import 'dart:html' as html;

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget selectedScreen = DelayLoading();
  @override
  void initState() {
    getSharedPrefs();
  }

  getSharedPrefs() async {
    String? adminId = html.window.localStorage['adminId'];
    if (adminId == null) {
      selectedScreen=LoginScreen();
    }else{
      print(adminId);
      selectedScreen=DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Khushi Dua',
      debugShowCheckedModeBanner: false,
      initialBinding: InitController(),
      home: selectedScreen,
    );
  }
}

