import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/my_booking/coupon_sent_request.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class AddCoupon extends StatelessWidget {
  const AddCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    double? height, width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: addcouponLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              DesignConfig.setPngPath(coupon_image),
              height: 72,
            ),
            const SizedBox(
              height: 18,
            ),
            Image.asset(
              DesignConfig.setPngPath(coupon_image),
              height: 72,
            ),
            const Spacer(),
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
                              const couponSentRequestBooking()));
                })
          ],
        ),
      ),
    );
  }
}
