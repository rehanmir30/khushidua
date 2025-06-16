import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khushiduaadmin/controllers/notificationController.dart';
import 'package:khushiduaadmin/models/notificationModel.dart';
import 'package:intl/intl.dart';
import '../../constants/colors.dart';
import '../../widgets/customSnackbar.dart';
import '../../widgets/topBar.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBlack,
      body: GetBuilder<NotificationController>(
        builder: (notificationController) {
          return Column(
            children: [
              TopBar(title: "Notifications"),

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(color: rGreen, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svgs/add.svg"),
                          Text(
                            "Send a global notification",
                            style: TextStyle(color: rWhite),
                          ).marginOnly(left: 8)
                        ],
                      ).marginAll(12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: rBg),
                child: Column(
                  children: [
                    TableHeader(),
                    ListView.builder(
                      itemCount: notificationController.allNotifications.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return  NotificationTile(notificationController.allNotifications[index]);
                      },
                    ),
                  ],
                ),
              )
            ],
          ).marginSymmetric(horizontal: 12, vertical: 12);
        },
      ),
    );
  }

  showSendNotificationPopup() async {
    NotificationController _notificationController = Get.find<NotificationController>();
    TextEditingController notificationTitleController = TextEditingController();
    TextEditingController notificationDescriptionController = TextEditingController();

    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          child: StatefulBuilder(
            builder: (context, setState) {
              return GetBuilder<NotificationController>(
                builder: (controller) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: rWhite),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),color: rBlack),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Send notification",
                                style: TextStyle(color: rWhite),
                              ),
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: rWhite),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: rWhite,
                                      )))
                            ],
                          ).marginSymmetric(horizontal: 20, vertical: 12),
                        ),

                        //entries
                        //Title and Description
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Title
                            Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                // height: 42,
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,

                                  controller: notificationTitleController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: rBlack),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // hintText: "Product name",
                                    labelText: "Notification Title *",
                                    fillColor: rWhite,
                                    filled: true,
                                    // contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: rWhite, width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: rWhite)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: rWhite)),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: rWhite, width: 1),
                                    ),
                                    hintStyle: TextStyle(color: rBlack.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                            ),

                            //Description
                            Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                // height: 42,
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: notificationDescriptionController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: rBlack),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // hintText: "Product name",
                                    labelText: "Notification Description *",
                                    fillColor: rWhite,
                                    filled: true,
                                    // contentPadding: const EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: rWhite, width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: rWhite)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: rWhite)),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(color: rWhite, width: 1),
                                    ),
                                    hintStyle: TextStyle(color: rBlack.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 30).marginOnly(top: 40),

                        SizedBox(
                          height: 60,
                        ),

                        //action buttons
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (notificationTitleController.text.isEmpty) {

                                      CustomSnackbar.show("Error", "Title is required",isSuccess: false);
                                      return;
                                    } else if (notificationDescriptionController.text.isEmpty) {
                                      CustomSnackbar.show("Error", "Description is required", isSuccess: false);
                                      return;
                                    } else {
                                      Navigator.pop(context);
                                      await _notificationController.sendGlobalNotification(notificationTitleController.text, notificationDescriptionController.text);
                                    }
                                  },
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: rGreen),
                                    child: Text(
                                      "Send",
                                      style: TextStyle(color: rWhite),
                                    ).marginAll(10).marginOnly(left: 20, right: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: rBlack.withOpacity(0.7)),
                                    child: Text(
                                      "Cancel".tr,
                                      style: TextStyle(color: rWhite),
                                    ).marginAll(10).marginOnly(left: 20, right: 20),
                                  ),
                                ),
                              ],
                            ),

                            //resetButton for other popups goes here
                            Container()
                          ],
                        ).marginSymmetric(horizontal: 30).marginOnly(bottom: 20)
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}



Widget TableHeader() {
  return Container(
    decoration: BoxDecoration(
      color: rWhite.withOpacity(0.05),
    ),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "ID",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Title",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 4,
            child: Text(
              "Message",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "Created at",
              style: TextStyle(color: rHint, fontWeight: FontWeight.w600),
            )),
      ],
    ).marginSymmetric(horizontal: 12, vertical: 10),
  );
}

class NotificationTile extends StatefulWidget {
  final NotificationModel notificationModel;

  const NotificationTile(this.notificationModel, {super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "${"${widget.notificationModel.id.substring(0, 5)}..."}",
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 1,
            child: Text(
              "${"${widget.notificationModel.title}"}",
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 4,
            child: Text(
              "${widget.notificationModel.message}",
              style: TextStyle(color:  rWhite, fontWeight: FontWeight.normal),
            )),
        Expanded(
            flex: 1,
            child: Text(
              DateFormat('d MMMM y').format(widget.notificationModel.createdAt),
              style: TextStyle(color: rWhite, fontWeight: FontWeight.normal),
            )),
      ],
    ).marginSymmetric(horizontal: 12, vertical: 10);
  }

}
