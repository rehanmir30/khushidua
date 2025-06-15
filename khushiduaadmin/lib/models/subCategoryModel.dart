import 'package:flutter/material.dart';

class SubCategoryModel{
  String id = '';
  String arabic = '';
  String bengali = '';
  String burmese = '';
  String english = '';
  String french = '';
  String german = '';
  String gujrati = '';
  String hindi = '';
  String indonesian = '';
  String japanese = '';
  String korean = '';
  String malay = '';
  String mandrain = '';
  String marathi = '';
  String pashto = '';
  String persianFarsi = '';
  String portugese = '';
  String punjabi = '';
  String russian = '';
  String sindhi = '';
  String spanish = '';
  String tamil = '';
  String telgu = '';
  String turkish = '';
  String urdu = '';
  String vietnamese = '';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  bool isEnabled = true;
  int order=0;
  String categoryId="";
  bool littleKids=true;
  bool olderKids=true;
  bool grownUps=true;
  String image="";

  SubCategoryModel({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.arabic,
    required this.bengali,
    required this.burmese,
    required this.english,
    required this.french,
    required this.german,
    required this.gujrati,
    required this.hindi,
    required this.indonesian,
    required this.isEnabled,
    required this.japanese,
    required this.korean,
    required this.malay,
    required this.mandrain,
    required this.marathi,
    required this.pashto,
    required this.persianFarsi,
    required this.portugese,
    required this.punjabi,
    required this.russian,
    required this.sindhi,
    required this.spanish,
    required this.tamil,
    required this.telgu,
    required this.turkish,
    required this.updatedAt,
    required this.urdu,
    required this.vietnamese,
    required this.order,
    required this.categoryId,
    required this.grownUps,
    required this.littleKids,
    required this.olderKids,
  });

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map["id"] ?? '',
      createdAt: map["createdAt"] != null ? map["createdAt"].toDate() : DateTime.now(),
      updatedAt: map["updatedAt"] != null ? map["updatedAt"].toDate() : DateTime.now(),
      arabic: map["arabic"] ?? '',
      bengali: map["bengali"] ?? '',
      burmese: map["burmese"] ?? '',
      english: map["english"] ?? '',
      french: map["french"] ?? '',
      german: map["german"] ?? '',
      gujrati: map["gujrati"] ?? '',
      hindi: map["hindi"] ?? '',
      indonesian: map["indonesian"] ?? '',
      isEnabled: map["isEnabled"] ?? true,
      japanese: map["japanese"] ?? '',
      korean: map["korean"] ?? '',
      malay: map["malay"] ?? '',
      mandrain: map["mandrain"] ?? '',
      marathi: map["marathi"] ?? '',
      pashto: map["pashto"] ?? '',
      persianFarsi: map["persianFarsi"] ?? '',
      portugese: map["portugese"] ?? '',
      punjabi: map["punjabi"] ?? '',
      russian: map["russian"] ?? '',
      sindhi: map["sindhi"] ?? '',
      spanish: map["spanish"] ?? '',
      tamil: map["tamil"] ?? '',
      telgu: map["telgu"] ?? '',
      turkish: map["turkish"] ?? '',
      urdu: map["urdu"] ?? '',
      vietnamese: map["vietnamese"] ?? '',
      order: map["order"] ?? 0,
      littleKids: map["littleKids"] ?? true,
      olderKids: map["olderKids"] ?? true,
      grownUps: map["grownUps"] ?? true,
      categoryId: map["categoryId"] ?? '',
        image: map["image"]
    );
  }


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "createdAt": createdAt,
      "arabic": arabic,
      "bengali": bengali,
      "burmese": burmese,
      "english": english,
      "french": french,
      "german": german,
      "gujrati": gujrati,
      "hindi": hindi,
      "indonesian": indonesian,
      "isEnabled": isEnabled,
      "japanese": japanese,
      "korean": korean,
      "malay": malay,
      "mandrain": mandrain,
      "marathi": marathi,
      "pashto": pashto,
      "persianFarsi": persianFarsi,
      "portugese": portugese,
      "punjabi": punjabi,
      "russian": russian,
      "sindhi": sindhi,
      "spanish": spanish,
      "tamil": tamil,
      "telgu": telgu,
      "turkish": turkish,
      "updatedAt": updatedAt,
      "urdu": urdu,
      "vietnamese": vietnamese,
      "order": order,
      "grownUps": grownUps,
      "olderKids": olderKids,
      "littleKids": littleKids,
      "categoryId":categoryId,
      "image":image,
    };
  }

}