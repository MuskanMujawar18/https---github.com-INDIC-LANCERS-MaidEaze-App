import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/global/separate_card.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class LeaveDetailed extends StatefulWidget {
  const LeaveDetailed({super.key});

  @override
  State<LeaveDetailed> createState() {
    return _LeaveDetailedState();
  }
}

class _LeaveDetailedState extends State<LeaveDetailed> {
  bool isApproved1 = false;
  bool isApproved2 = false;
  double? height, width;

  @override
  Widget build(BuildContext context) {
    void showInfo(context) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => leaveInfo(context));
    }

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: leaveDetailesLbl,
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
          rightIcon: IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: black,
              size: 24,
            ),
            onPressed: () {
              showInfo(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceProvider(
                          "Akshita Singh",
                          "2.5 Km",
                          4.5,
                          "Lorem Ipsum is simply dummy text of the printing",
                          "pro_image_1",
                          "gold"),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(181, 228, 202, 0.05),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Cleaning Service",
                                  style: TextStyle(
                                      fontFamily: Manrope,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  "Ongoing",
                                  style: TextStyle(
                                      fontFamily: Manrope,
                                      fontSize: 14,
                                      color: appColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "10 September, 2024 - 10 October, 2024",
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  color: greayLightColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '13 September, 2024',
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s',
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 12,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ButtonContainer(
                                  top: 0,
                                  status: false,
                                  borderColor: appColor,
                                  bottom: 0,
                                  text: approveLbl,
                                  fontSize: 12,
                                  color: isApproved1 ? white : appColor,
                                  textColor: isApproved1 ? appColor : white,
                                  end: 0,
                                  circularRadius: 8,
                                  start: 0,
                                  height: height! / 1.7,
                                  width: width! / 3.2,
                                  onPressed: isApproved1
                                      ? null
                                      : () {
                                          setState(() {
                                            isApproved1 = true;
                                          });
                                        }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '13 September, 2024',
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s',
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 12,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ButtonContainer(
                                  top: 0,
                                  status: false,
                                  borderColor: appColor,
                                  bottom: 0,
                                  text: approveLbl,
                                  fontSize: 12,
                                  color: isApproved2 ? white : appColor,
                                  textColor: isApproved2 ? appColor : white,
                                  end: 0,
                                  circularRadius: 8,
                                  start: 0,
                                  height: height! / 1.7,
                                  width: width! / 3.2,
                                  onPressed: isApproved2
                                      ? null
                                      : () {
                                          setState(() {
                                            isApproved2 = true;
                                          });
                                        }),
                            ),
                          ],
                        ),
                      ),
                    ]))));
  }

  Widget leaveInfo(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(24, 36, 24, 36),
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 183,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.info_outline,
            size: 32,
            color: appColor,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Leave Information",
            style: TextStyle(
                fontFamily: Manrope,
                fontSize: 20,
                color: black,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Only two paid leaves are allowed in a month.",
            style: TextStyle(
                fontFamily: Manrope,
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.w500),
          )
        ]));
  }
}
