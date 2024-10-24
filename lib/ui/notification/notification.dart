import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/global/notification_card.dart';
import 'package:maideazw/ui/notification/notification_filter_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/imagesDefine.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  State<NotificationScreen> createState() {
    return _NotificationScreenState();
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    void opennotificationsheet(context) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => nofiticationbottomsheet(context));
    }

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
        // rightIcon: IconButton(
        //   icon: Icon(
        //     Icons.notifications_none, // Notification icon
        //     color: Colors.white,
        //     size: 28,
        //   ),
        //   onPressed: () {
        //     // Do something when notification icon is pressed
        //     print("Notification icon pressed");
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 250.0),
              child: Card(
                child: SizedBox(
                  height: 25,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset(
                      DesignConfig.setPngPath("setting_icon"),
                      height: 12,
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () => opennotificationsheet(context),
                      child: Text(
                        "  Filter",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 18,
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
                      color: const Color.fromARGB(255, 187, 225, 212),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greayColor)),
                  child: NotificationCard(
                    request:
                        "Akshita Singh send an offer for your cleaning service request.",
                    duration: "12h",
                    moredetailed: "Tap to see details ",
                    moredetailedColor: appColor,
                    imageUrl: pro_image_1,
                  ),
                ),
                NotificationCard(
                  request: "Geeta accepts your cooking service \nrequest.",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                NotificationCard(
                  request: "Geeta accepts your cooking service \nrequest.",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                NotificationCard(
                  request: "Geeta accepts your cooking service \nrequest.",
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

  Widget nofiticationbottomsheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Filter by Notification Date',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: Manrope),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: greayColor)),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD7EEE6), //green color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Manrope,
                          color: appColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  _buildByDate("Last 30 Days"),
                  _buildByDate("Last 3 Months"),
                  _buildByDate("Last 6 Months"),
                  _buildByDate("2024"),
                  _buildByDate("2023"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonContainer(
              top: 8,
              status: false,
              borderColor: appColor,
              bottom: 5,
              text: applyLbl,
              fontSize: 16,
              color: appColor,
              textColor: white,
              end: 0,
              circularRadius: 8,
              start: 0,
              height: height,
              width: width,
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NotificationFilterScreen()));
              })
        ],
      ),
    );
  }

  Widget _buildByDate(String date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 12,
          fontFamily: Manrope,
          fontWeight: FontWeight.w500,
          color: black,
        ),
      ),
    );
  }
}
