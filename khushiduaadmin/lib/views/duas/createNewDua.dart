import 'dart:html' as html;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/controllers/categoryController.dart';
import 'package:khushiduaadmin/controllers/duaController.dart';
import 'package:khushiduaadmin/models/duaModel.dart';

import '../../constants/colors.dart';
import '../../models/subCategoryModel.dart';
import '../../widgets/customDropDown.dart';
import '../../widgets/customLoading.dart';
import '../../widgets/customSnackbar.dart';
import '../../widgets/topBar.dart';

class CreateNewDua extends StatefulWidget {
  const CreateNewDua({super.key});

  @override
  State<CreateNewDua> createState() => _CreateNewDuaState();
}

class _CreateNewDuaState extends State<CreateNewDua> {
  var formKey = GlobalKey<FormState>();
  TextEditingController arabicTextEditingController = TextEditingController();
  TextEditingController bengaliTextEditingController = TextEditingController();
  TextEditingController transliterationTextEditingController = TextEditingController();
  TextEditingController englishTextEditingController = TextEditingController();
  TextEditingController frenchTextEditingController = TextEditingController();
  TextEditingController germanTextEditingController = TextEditingController();
  TextEditingController gujratiTextEditingController = TextEditingController();
  TextEditingController hindiTextEditingController = TextEditingController();
  TextEditingController indonesianTextEditingController = TextEditingController();
  TextEditingController japaneseTextEditingController = TextEditingController();
  TextEditingController malayTextEditingController = TextEditingController();
  TextEditingController mandrainTextEditingController = TextEditingController();
  TextEditingController marathiTextEditingController = TextEditingController();
  TextEditingController portugeseTextEditingController = TextEditingController();
  TextEditingController punjabiTextEditingController = TextEditingController();
  TextEditingController russianTextEditingController = TextEditingController();
  TextEditingController sindhiTextEditingController = TextEditingController();
  TextEditingController spanishTextEditingController = TextEditingController();
  TextEditingController tamilTextEditingController = TextEditingController();
  TextEditingController telguTextEditingController = TextEditingController();
  TextEditingController turkishTextEditingController = TextEditingController();
  TextEditingController urduTextEditingController = TextEditingController();
  bool isLittleKids = true;
  bool isOlderKids = true;
  bool isGrownUps = true;

  // html.File? duaImage;
  // String? duaImageUrl;

  html.File? littleKidmp3File;
  html.File? olderKidmp3File;
  html.File? grownUpmp3File;

  List<SubCategoryModel> selectedSubCategories = [];

  // void pickImage() {
  //   final html.FileUploadInputElement input = html.FileUploadInputElement();
  //   input.accept = 'image/*';
  //   input.click();
  //
  //   input.onChange.listen((event) {
  //     if (input.files!.isNotEmpty) {
  //       final file = input.files!.first;
  //       final objectUrl = html.Url.createObjectUrl(file);
  //
  //       setState(() {
  //         duaImage = file;
  //         duaImageUrl = objectUrl;
  //       });
  //     }
  //   });
  // }

  void pickMp3File(String type) {
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input.accept = 'audio/mp3'; // Accept only MP3 files
    input.click();

    input.onChange.listen((event) {
      if (input.files!.isNotEmpty) {
        if (type == "littleKid") {
          littleKidmp3File = input.files!.first;
          setState(() {
            littleKidmp3File;
          });
        } else if (type == "olderKid") {
          olderKidmp3File = input.files!.first;
          setState(() {
            olderKidmp3File;
          });
        } else {
          grownUpmp3File = input.files!.first;
          setState(() {
            grownUpmp3File;
          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBlack,
      body: GetBuilder<CategoryController>(builder: (categoryController) {
        return GetBuilder<DuaController>(
          builder: (duaController) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBar(title: "Dua"),
                      Text(
                        "Add New Dua",
                        style: TextStyle(color: rWhite, fontSize: 20),
                      ).marginOnly(top: 20),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: Text(
                              "dua / ",
                              style: TextStyle(color: rGreen),
                            ),
                          ),
                          Text(
                            "add new dua",
                            style: TextStyle(color: rWhite),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: rBg,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //left side
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Row(
                                          //   children: [
                                          //     SizedBox(
                                          //       width: MediaQuery.of(context).size.width * 0.05,
                                          //     ),
                                          //     Column(
                                          //       children: [
                                          //         Text(
                                          //           "Image",
                                          //           style: TextStyle(color: rHint),
                                          //         ),
                                          //         InkWell(
                                          //           onTap: () {
                                          //             pickImage();
                                          //           },
                                          //           child: duaImage != null
                                          //               ? Container(
                                          //             width: 60,
                                          //             height: 60,
                                          //             child: ClipRRect(
                                          //               borderRadius: BorderRadius.circular(10),
                                          //               child: Image.network(duaImageUrl!, fit: BoxFit.fill),
                                          //             ),
                                          //           ).marginOnly(top: 20)
                                          //               : DottedBorder(
                                          //               color: rHint,
                                          //               radius: Radius.circular(8),
                                          //               borderType: BorderType.Rect,
                                          //               dashPattern: [8, 4],
                                          //               child: Container(
                                          //                 width: 60,
                                          //                 height: 60,
                                          //                 alignment: Alignment.center,
                                          //                 child: Column(
                                          //                   mainAxisSize: MainAxisSize.min,
                                          //                   children: [
                                          //                     SvgPicture.asset("assets/svgs/upload.svg"),
                                          //                   ],
                                          //                 ),
                                          //               )).marginOnly(top: 20),
                                          //         ),
                                          //       ],
                                          //     )
                                          //   ],
                                          // ),
                                          Text(
                                            "Dua (English)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: englishTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "English dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in English',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          Text(
                                            "Dua (Transliteration)(English)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: transliterationTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Transliteration is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Transliteration in English',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          Text(
                                            "Dua (Arabic)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: arabicTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Arabic dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Arabic',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Bengali)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: bengaliTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Bengali dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Bengali',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (French)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: frenchTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "French dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in French',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (German)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: germanTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "German dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in German',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Gujrati)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: gujratiTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Gujrati dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Gujrati',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Hindi)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: hindiTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Hindi dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Hindi',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Indonesian)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: indonesianTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Indonesian dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Indonesian',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),

                                          Text(
                                            "Sub Categories",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          // SizedBox(
                                          //   child: Theme(
                                          //     data: Theme.of(context).copyWith(
                                          //       canvasColor: rBlack,
                                          //     ),
                                          //     child: DropdownButtonFormField<SubCategoryModel>(
                                          //       decoration: InputDecoration(
                                          //         filled: true,
                                          //         fillColor: Colors.transparent,
                                          //         hintText: selectedSubCategories.isEmpty ? 'Select sub categories' : selectedSubCategories.map((item) => item.english).join(', '),
                                          //         suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                                          //         hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                          //         border: OutlineInputBorder(
                                          //           borderRadius: BorderRadius.circular(8.0),
                                          //         ),
                                          //         enabledBorder: OutlineInputBorder(
                                          //           borderSide: BorderSide(color: Colors.grey),
                                          //           borderRadius: BorderRadius.circular(8.0),
                                          //         ),
                                          //         focusedBorder: OutlineInputBorder(
                                          //           borderSide: BorderSide(color: Colors.grey),
                                          //           borderRadius: BorderRadius.circular(8.0),
                                          //         ),
                                          //         contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                          //       ),
                                          //       icon: SizedBox.shrink(),
                                          //       items: categoryController.allSubCategories.map((SubCategoryModel item) {
                                          //         return DropdownMenuItem<SubCategoryModel>(
                                          //           value: item,
                                          //           child: StatefulBuilder(
                                          //             builder: (context, menuSetState) {
                                          //               final isSelected = selectedSubCategories.contains(item);
                                          //               return InkWell(
                                          //                 onTap: () {
                                          //                   setState(() {
                                          //                     isSelected ? selectedSubCategories.remove(item) : selectedSubCategories.add(item);
                                          //                   });
                                          //                   menuSetState(() {});
                                          //                 },
                                          //                 child: SizedBox(
                                          //                   height: 40,
                                          //                   child: Row(
                                          //                     children: [
                                          //                       Icon(
                                          //                         isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                                          //                         color: isSelected ? Colors.green : Colors.grey,
                                          //                       ),
                                          //                       const SizedBox(width: 16),
                                          //                       Text(
                                          //                         item.english,
                                          //                         style: TextStyle(fontSize: 14, color: rWhite),
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               );
                                          //             },
                                          //           ),
                                          //         );
                                          //       }).toList(),
                                          //       onChanged: (_) {},
                                          //     ),
                                          //   ),
                                          // ),
                                      SearchableMultiSelectDropdown(
                                           items: categoryController.allSubCategories,
                                           initiallySelected: selectedSubCategories,
                                           onChanged: (list) => setState(() => selectedSubCategories = list),
                                         ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Little kid audio",
                                                style: TextStyle(color: rHint),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  pickMp3File("littleKid");
                                                },
                                                child: DottedBorder(
                                                    color: rHint,
                                                    radius: Radius.circular(8),
                                                    borderType: BorderType.RRect,
                                                    dashPattern: [8, 4],
                                                    child: Container(
                                                      // width: 60,
                                                      height: 100,
                                                      alignment: Alignment.center,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          littleKidmp3File == null
                                                              ? SvgPicture.asset("assets/svgs/upload.svg")
                                                              : Icon(
                                                            Icons.file_copy_outlined,
                                                            color: rHint,
                                                          ),
                                                          Text(
                                                            littleKidmp3File == null ? "Upload Audio Sound" : "${littleKidmp3File!.name}",
                                                            style: TextStyle(color: rHint, fontWeight: FontWeight.w600, fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ).marginOnly(top: 20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Older kid audio",
                                                style: TextStyle(color: rHint),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  pickMp3File("olderKid");
                                                },
                                                child: DottedBorder(
                                                    color: rHint,
                                                    radius: Radius.circular(8),
                                                    borderType: BorderType.RRect,
                                                    dashPattern: [8, 4],
                                                    child: Container(
                                                      // width: 60,
                                                      height: 100,
                                                      alignment: Alignment.center,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          olderKidmp3File == null
                                                              ? SvgPicture.asset("assets/svgs/upload.svg")
                                                              : Icon(
                                                            Icons.file_copy_outlined,
                                                            color: rHint,
                                                          ),
                                                          Text(
                                                            olderKidmp3File == null ? "Upload Audio Sound" : "${olderKidmp3File!.name}",
                                                            style: TextStyle(color: rHint, fontWeight: FontWeight.w600, fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ).marginOnly(top: 20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Grown up audio",
                                                style: TextStyle(color: rHint),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  pickMp3File("grownUp");
                                                },
                                                child: DottedBorder(
                                                    color: rHint,
                                                    radius: Radius.circular(8),
                                                    borderType: BorderType.RRect,
                                                    dashPattern: [8, 4],
                                                    child: Container(
                                                      // width: 60,
                                                      height: 100,
                                                      alignment: Alignment.center,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          grownUpmp3File == null
                                                              ? SvgPicture.asset("assets/svgs/upload.svg")
                                                              : Icon(
                                                            Icons.file_copy_outlined,
                                                            color: rHint,
                                                          ),
                                                          Text(
                                                            grownUpmp3File == null ? "Upload Audio Sound" : "${grownUpmp3File!.name}",
                                                            style: TextStyle(color: rHint, fontWeight: FontWeight.w600, fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ).marginOnly(top: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                    value: isLittleKids,
                                                    activeColor: rGreen,
                                                    checkColor: Colors.white,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        isLittleKids = val!;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Little Kids",
                                                    style: TextStyle(color: rWhite),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                    value: isOlderKids,
                                                    activeColor: rGreen,
                                                    checkColor: Colors.white,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        isOlderKids = val!;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Older Kids",
                                                    style: TextStyle(color: rWhite),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Checkbox(
                                                    value: isGrownUps,
                                                    activeColor: rGreen,
                                                    checkColor: Colors.white,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        isGrownUps = val!;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Grown Ups",
                                                    style: TextStyle(color: rWhite),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ).marginOnly(top: 20),
                                        ],
                                      ).marginSymmetric(horizontal: 12),
                                    ),
                                  ),

                                  //right side
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dua (Japanese)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: japaneseTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Japanese dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Japanese',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Malay)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: malayTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Malay dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Malay',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Mandrain)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: mandrainTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Mandrain dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Mandrain',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Marathi)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: marathiTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Marathi dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Name in Marathi',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Portugese)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: portugeseTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Portugese dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Portugese',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Punjabi)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: punjabiTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Punjabi dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Punjabi',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Russian)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: russianTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Russian dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Russian',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Sindhi)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: sindhiTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Sindhi dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Sindhi',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Spanish)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: spanishTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Spanish dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Spanish',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Tamil)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: tamilTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Tamil dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Tamil',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Telgu)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: telguTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Telgu dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Telgu',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Turkish)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: turkishTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Turkish dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Turkish',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Dua (Urdu)",
                                            style: TextStyle(color: rHint),
                                          ).marginOnly(top: 20),
                                          TextFormField(
                                            cursorColor: rGreen,
                                            controller: urduTextEditingController,
                                            validator: (diameter) {
                                              if (diameter == null || diameter.isEmpty) {
                                                return "Urdu dua is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Dua in Urdu',
                                              hintStyle: TextStyle(
                                                color: rHint.withOpacity(0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: rHint,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ).marginSymmetric(horizontal: 12)),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      // if (duaImage == null) {
                                      //   CustomSnackbar.show("Error", "Dua image is required", isSuccess: false);
                                      // }else
                                        if(littleKidmp3File==null || olderKidmp3File==null ||grownUpmp3File==null){
                                        CustomSnackbar.show("Error", "Audio files are required", isSuccess: false);
                                      }else if(selectedSubCategories.isEmpty){
                                        CustomSnackbar.show("Error", "Select atleast one sub category", isSuccess: false);
                                      } else {
                                        List<String> subIds=[];
                                        for(var item in selectedSubCategories){
                                          subIds.add(item.id);
                                        }
                                        DuaModel duaModel = DuaModel(
                                            id: "",
                                            createdAt: DateTime.now(),
                                            // image: "",
                                            arabic: arabicTextEditingController.text,
                                            bengali: bengaliTextEditingController.text,
                                            transliteration: transliterationTextEditingController.text,
                                            english: englishTextEditingController.text,
                                            french: frenchTextEditingController.text,
                                            german: germanTextEditingController.text,
                                            gujrati: gujratiTextEditingController.text,
                                            hindi: hindiTextEditingController.text,
                                            indonesian: indonesianTextEditingController.text,
                                            isEnabled: true,
                                            japanese: japaneseTextEditingController.text,
                                            malay: malayTextEditingController.text,
                                            mandrain: mandrainTextEditingController.text,
                                            marathi: marathiTextEditingController.text,
                                            portugese: portugeseTextEditingController.text,
                                            punjabi: punjabiTextEditingController.text,
                                            russian: russianTextEditingController.text,
                                            sindhi: sindhiTextEditingController.text,
                                            spanish: spanishTextEditingController.text,
                                            tamil: tamilTextEditingController.text,
                                            telgu: telguTextEditingController.text,
                                            turkish: turkishTextEditingController.text,
                                            updatedAt: DateTime.now(),
                                            urdu: urduTextEditingController.text,
                                            order: duaController.allDuas.length + 1,
                                            grownUps: isGrownUps,
                                            littleKids: isLittleKids,
                                            olderKids: isOlderKids,
                                            subCategoryIds: subIds,
                                            grownUpsAudio: '',
                                            littleKidsAudio: '',
                                            olderKidsAudio: '');

                                        duaController.createDua(duaModel,
                                            // duaImage!,
                                            grownUpmp3File!,littleKidmp3File!,olderKidmp3File!);
                                      }
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: rGreen,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: rWhite),
                                    ).marginSymmetric(vertical: 12),
                                  ).marginOnly(top: 12),
                                ),
                              )
                            ],
                          ).marginSymmetric(horizontal: 15, vertical: 15),
                        ).marginOnly(top: 12),
                      ),
                    ],
                  ).marginSymmetric(horizontal: 12, vertical: 12),
                ),
                Visibility(
                    visible: duaController.isLoading,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: rWhite.withOpacity(0.2),
                        child: CustomLoading()))
              ],
            );
          },
        );
      },),
    );
  }
}
