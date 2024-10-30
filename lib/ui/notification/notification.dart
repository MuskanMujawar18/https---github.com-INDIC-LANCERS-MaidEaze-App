import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/global/notification_card.dart';
import 'package:maideaze/ui/notification/notification_filter_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  State<NotificationScreen> createState() {
    return _NotificationScreenState();
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  double? height, width;
  String? selectedFilter = "Today";

  @override
  Widget build(BuildContext context) {
    void opennotificationsheet(context) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => StatefulBuilder(
                builder:
                    (BuildContext context, StateSetter setBottomSheetState) {
                  return nofiticationbottomsheet(context, setBottomSheetState);
                },
              ));
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
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.only(left: width! / 1.55),
                height: 30,
                child: Card(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset(
                      DesignConfig.setPngPath(setting_icon),
                      height: 12,
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () => opennotificationsheet(context),
                      child: const Text(
                        "  Filter",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(
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
                    color: const Color.fromRGBO(181, 228, 202, 0.26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const NotificationCard(
                    request:
                        "Akshita Singh send an offer for your cleaning service request.",
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
                  request: "Geeta accepts your cooking service \nrequest.",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                const SizedBox(
                  height: 15,
                ),
                const NotificationCard(
                  request: "Geeta accepts your cooking service \nrequest.",
                  duration: "20h",
                  moredetailed: "Tap to see details ",
                  moredetailedColor: greayLightColor,
                  imageUrl: pro_image_1,
                ),
                const SizedBox(
                  height: 15,
                ),
                const NotificationCard(
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

  Widget nofiticationbottomsheet(
      BuildContext context, StateSetter setBottomSheetState) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: greayColor),
              ),
              child: ListView(
                children: [
                  _buildByDate("Today", setBottomSheetState),
                  _buildByDate("Last 30 Days", setBottomSheetState),
                  _buildByDate("Last 3 Months", setBottomSheetState),
                  _buildByDate("2024", setBottomSheetState),
                  _buildByDate("2023", setBottomSheetState),
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

  Widget _buildByDate(String date, StateSetter setBottomSheetState) {
    bool isSelected = selectedFilter == date;
    return GestureDetector(
      onTap: () {
        setBottomSheetState(() {
          selectedFilter = date;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromRGBO(181, 228, 202, 0.25)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Text(
          date,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? appColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
