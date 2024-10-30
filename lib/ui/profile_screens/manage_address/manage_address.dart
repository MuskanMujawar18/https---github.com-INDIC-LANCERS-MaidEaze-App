import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/profile_screens/manage_address/add_new_address.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class ManageAddress extends StatelessWidget {
  const ManageAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: manageaddLbl,
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
            addressContainer("Home", "XYZ, building name, city, sate, etc."),
            const SizedBox(
              height: 15,
            ),
            addressContainer("Office", "XYZ, building name, city, sate, etc."),
            Spacer(),
            CustomPaint(
              painter: DashedBorderPainter(),
              child: Container(
                // margin: EdgeInsets.all(16),
                color: Color.fromRGBO(181, 228, 202, 0.25),
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewAddress()));
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 24,
                        color: appColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add New Address",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: appColor,
                            fontFamily: Manrope),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addressContainer(String location, String address) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: greayColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            DesignConfig.setPngPath(location_colored),
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: Manrope),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                address,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: greayLightColor,
                    fontFamily: Manrope),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double borderRadius;

  DashedBorderPainter({this.borderRadius = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = appColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double dashWidth = 5, dashSpace = 3;
    final path = Path();

    // Define a rounded rectangle with a border radius
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Create a path for the rounded rectangle border
    path.addRRect(rect);

    // Use PathMetrics to get the dashed effect on the rounded rectangle
    final pathMetrics = path.computeMetrics();
    for (var metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
