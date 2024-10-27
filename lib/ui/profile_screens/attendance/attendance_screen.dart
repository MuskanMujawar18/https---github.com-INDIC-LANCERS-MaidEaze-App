import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/profile_screens/attendance/attendance_detailed.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() {
    return _AttendanceScreenState();
  }
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  double? height, width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: attendanceLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            attendanceCard(
                pro_image_1, "Akshita Sing", "gold", 4.5, "2.5 Km", "Cooking",
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendanceDetailed()));
            }),
            const SizedBox(
              height: 24,
            ),
            attendanceCard(pro_image_1, "Akshita Sing", "gold", 4.5, "2.5 Km",
                "Cooking + Cleaning", () {}),
            const SizedBox(
              height: 24,
            ),
            attendanceCard(pro_image_1, "Akshita Sing", "gold", 4.5, "2.5 Km",
                "Vessel Cleaning", () {}),
          ],
        ),
      ),
    );
  }

  Widget attendanceCard(
      String imageUrl,
      String name,
      String rank,
      double rating,
      String distance,
      String service,
      final VoidCallback? onTapped) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 8),
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: greayColor)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              DesignConfig.setPngPath(imageUrl),
              width: 61,
              height: 57,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 12,
                      color: black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (rank == 'gold') ...[
                    Image.asset(
                      DesignConfig.setPngPath(crown_golden),
                      height: 12,
                      width: 12,
                    )
                  ] else if (rank == 'silver') ...[
                    Image.asset(
                      DesignConfig.setPngPath(crown_silver),
                      height: 12,
                      width: 12,
                    ),
                  ],
                  SizedBox(
                    width: width! / 3.6,
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color.fromRGBO(255, 153, 0, 0.1)),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(star),
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$rating',
                          style: const TextStyle(
                              fontFamily: Manrope,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFF9900)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    DesignConfig.setPngPath(location_outlined),
                    height: 10,
                    width: 10,
                    color: greayLightColor,
                  ),
                  Text(
                    ' $distance away',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: Manrope,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: greayLightColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(181, 228, 202, 0.25),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  service,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: appColor),
                ),
              ),
            ]),
          ])),
    );
  }
}
