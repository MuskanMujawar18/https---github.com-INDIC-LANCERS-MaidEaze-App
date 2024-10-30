import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/my_booking/sent_request_mybooking/add_coupon.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class SentRequestBooking extends StatefulWidget {
  const SentRequestBooking({super.key});

  @override
  State<SentRequestBooking> createState() {
    return _SentRequestBookingState();
  }
}

class _SentRequestBookingState extends State<SentRequestBooking> {
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceProvider(
                          "Akshita Singh",
                          "2.5 Km",
                          4,
                          "Lorem Ipsum is simply dummy text of the printing",
                          "pro_image_1",
                          "gold"),
                      const SizedBox(
                        height: 25,
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
                              _buildRow("Grand Total", "₹30185/-",
                                  isTotal: true),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Tip your service provider",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "Your kindness means a lot! 100% of your tip will go directly to them",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 8,
                            color: greayLightColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(181, 228, 202, 0.25),
                                border: Border.all(color: appColor, width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "₹20",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: Manrope,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: appColor, width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "₹30",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: Manrope,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: appColor, width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "₹50",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: Manrope,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: appColor, width: 0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "₹100",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: Manrope,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greayColor)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddCoupon()));
                          },
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                DesignConfig.setPngPath(ticket),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                "Apply Coupon",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ButtonContainer(
                          top: 8,
                          status: false,
                          borderColor: appColor,
                          bottom: 5,
                          text: paynowLbl,
                          fontSize: 16,
                          color: appColor,
                          textColor: white,
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
                          })
                    ]))));
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

  Widget ServiceProvider(
    final String name,
    final String distance,
    final double rating,
    final String info,
    final String imageUrl,
    final String rank,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greayColor)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  DesignConfig.setPngPath(imageUrl),
                  height: 57,
                  width: 61,
                )),
            title: Row(
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
                  )
                ],
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
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
                ),
                const SizedBox(
                  height: 3,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      info,
                      style: const TextStyle(
                          fontFamily: Manrope,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: greayLightColor),
                    )),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 153, 0, 0.15),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            onTap: () {},
          ),
          const Divider(
            color: greayLightColor,
            indent: 10,
            endIndent: 10,
          ),
          const Text(
            "Cleaning + Laundry Service",
            style: TextStyle(
                fontFamily: Manrope, fontSize: 12, fontWeight: FontWeight.w600),
          )
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
