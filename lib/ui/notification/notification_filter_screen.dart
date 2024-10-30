import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/notification_card.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class NotificationFilterScreen extends StatefulWidget {
  const NotificationFilterScreen({super.key});

  State<NotificationFilterScreen> createState() {
    return _NotificationFilterScreenState();
  }
}

class _NotificationFilterScreenState extends State<NotificationFilterScreen> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: notificationsLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 250.0,
              ),
              child: Card(
                color: const Color(0xFFD7EEE6),
                child: SizedBox(
                  height: 25,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset(
                      DesignConfig.setPngPath(setting_icon),
                      height: 12,
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "  Filter  ",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(
                      Icons.close,
                      size: 12,
                    )
                  ]),
                ),
              ),
            ),
            Expanded(
              child: ListView(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: lightgreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const NotificationCard(
                    request: "Geeta accepts your cooking service request",
                    duration: "12h",
                    moredetailed: "Tap to see details ",
                    moredetailedColor: appColor,
                    imageUrl: pro_image_1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const NotificationCard(
                  request: "Geeta accepts your cooking service request",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                const SizedBox(
                  height: 15,
                ),
                const NotificationCard(
                  request: "Geeta accepts your cooking service request",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                const SizedBox(
                  height: 15,
                ),
                const NotificationCard(
                  request: "Geeta accepts your cooking service request",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
