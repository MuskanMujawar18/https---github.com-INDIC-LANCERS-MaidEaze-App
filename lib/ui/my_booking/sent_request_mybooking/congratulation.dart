import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              DesignConfig.setPngPath(request_send_image),
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Congratulations!",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your",
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 12,
                      color: greayLightColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " Cleaning + Laundry service",
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 12,
                      color: appColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " is booked.",
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 12,
                      color: greayLightColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Text(
              "You can see all the details in bookings section.",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  color: greayLightColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
