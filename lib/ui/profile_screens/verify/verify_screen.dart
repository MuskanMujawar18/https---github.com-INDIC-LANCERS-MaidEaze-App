import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/profile_screens/verify/police_varification_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: verifymaidLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: greayColor),
                  borderRadius: BorderRadius.circular(8)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PoliceVeriScreen()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      DesignConfig.setPngPath(verify),
                      height: 20,
                      width: 20,
                      color: appColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Police Verification",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: Manrope,
                          color: black),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 16,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
