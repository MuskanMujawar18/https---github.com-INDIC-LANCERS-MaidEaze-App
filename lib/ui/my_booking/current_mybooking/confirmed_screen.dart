import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';

class ConfirmedScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
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
            Text(
              "Confirmed!",
              style: TextStyle(
                fontFamily: Manrope,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Service provider is",
                  style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: greayLightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " replaced.",
                  style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: appColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              "Refund amount will be added to your MaidEaze’s wallet.",
              style: TextStyle(
                fontFamily: Manrope,
                fontSize: 12,
                color: greayLightColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
