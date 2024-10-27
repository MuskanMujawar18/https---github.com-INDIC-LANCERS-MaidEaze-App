import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class PoliceVeriScreen extends StatelessWidget {
  const PoliceVeriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double? height, width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: policeverifLbl,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Lorem ipsum dolor sit amet consectetur. Felis nunc consequat massa egestas feugiat quis tristique. Fringilla venenatis sagittis in p",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4E4E4E)),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                width: width,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: greayColor),
              ),
              Spacer(),
              ButtonContainer(
                  top: 8,
                  status: false,
                  borderColor: appColor,
                  bottom: 5,
                  text: requestLbl,
                  fontSize: 16,
                  color: appColor,
                  textColor: white,
                  end: 0,
                  circularRadius: 8,
                  start: 0,
                  height: height,
                  width: width,
                  onPressed: () {})
            ])));
  }
}
