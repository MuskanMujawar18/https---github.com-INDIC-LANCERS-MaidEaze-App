import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/global/separate_card.dart';
import 'package:maideaze/ui/review_screen/review_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class CurrentBookingCompleted extends StatefulWidget {
  const CurrentBookingCompleted({super.key});

  @override
  State<CurrentBookingCompleted> createState() {
    return _CurrentBookingCompletedState();
  }
}

class _CurrentBookingCompletedState extends State<CurrentBookingCompleted> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: mybookingdetailedLbl,
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greayColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Cleaning service",
                                  style: TextStyle(
                                      fontFamily: Manrope,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(
                                        181, 228, 202, 0.25),
                                  ),
                                  child: const Text(
                                    completedLbl,
                                    style: TextStyle(
                                        fontFamily: Manrope,
                                        fontSize: 12,
                                        color: appColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              "10 September, 2023 - 10 October, 2023",
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  color: greayLightColor,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "About Service Provider",
                      style: TextStyle(
                          fontFamily: Manrope,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ServiceProvider(
                        "Akshita Singh",
                        "2.5 Km",
                        4,
                        "Lorem Ipsum is simply dummy text of the printing",
                        "pro_image_1",
                        "gold"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                          fontFamily: Manrope,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.watch_later,
                          size: 18,
                          color: appColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "10:00 AM - 12:00 PM (Morning)",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(calendar),
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "10 September, 2023 - 10 October, 2023",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(location_colored),
                          height: 18,
                          color: appColor,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "X-25, Building name , Society, City, State, 201010",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomPaint(
                      painter: DashedBorderPainter(),
                      child: Container(
                        // margin: EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow("Monthly Price", "₹30000"),
                            const SizedBox(
                              height: 15,
                            ),
                            _buildRow("Service Charges", "₹60"),
                            const SizedBox(
                              height: 15,
                            ),
                            _buildRow("Platform Fee", "₹35"),
                            const SizedBox(
                              height: 15,
                            ),
                            _buildRow("GST", "₹90"),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: appColor,
                              thickness: 0.5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildRow("Grand Total", "₹30185/-", isTotal: true),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonContainer(
                        top: 8,
                        status: false,
                        borderColor: appColor,
                        bottom: 5,
                        text: retainLbl,
                        fontSize: 16,
                        color: white,
                        textColor: appColor,
                        end: 0,
                        circularRadius: 8,
                        start: 0,
                        height: height,
                        width: width,
                        onPressed: () async {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HelperDetailed()));
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonContainer(
                        top: 8,
                        status: false,
                        borderColor: appColor,
                        bottom: 5,
                        text: reviewLbl,
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
                                  builder: (context) => ReviewScreen()));
                        })
                  ])),
        ));
  }

  Widget _buildRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
                color: black),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600,
              color: isTotal ? appColor : black,
            ),
          ),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = appColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 3;
    final path = Path();

    double startX = 0;
    while (startX < size.width) {
      path.moveTo(startX, 0);
      path.lineTo(startX + dashWidth, 0);
      startX += dashWidth + dashSpace;
    }

    double startY = 0;
    while (startY < size.height) {
      path.moveTo(size.width, startY);
      path.lineTo(size.width, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.width) {
      path.moveTo(startX, size.height);
      path.lineTo(startX + dashWidth, size.height);
      startX += dashWidth + dashSpace;
    }

    startY = 0;
    while (startY < size.height) {
      path.moveTo(0, startY);
      path.lineTo(0, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
