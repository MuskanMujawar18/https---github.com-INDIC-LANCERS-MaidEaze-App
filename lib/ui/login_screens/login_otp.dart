import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/mpin_screen/mpin_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class LoginOtpScreen extends StatefulWidget {
  const LoginOtpScreen({super.key});

  @override
  State<LoginOtpScreen> createState() {
    return _LoginOtpScreenState();
  }
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  double? height, width;
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: greyLight,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 393,
                  width: width,
                  color: appColor,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 320, bottom: 20),
                    child: SizedBox(
                      width: width,
                      height: 242,
                      child: Container(
                        // color: Colors.red,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white),
                        child: Column(children: [
                          const SizedBox(
                            height: 48,
                          ),
                          const Text(
                            otpLbl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                fontFamily: Manrope),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            otpsubLbl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: Manrope,
                                color: greayLightColor),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 10.0),
                            child: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: greyLight,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20))),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ]),
                      ),
                    )),
                Positioned(
                  top: 285,
                  left: (width! / 2) - 32,
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: greayColor),
                  ),
                ),
              ],
            ),
            ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 10,
                text: submitLbl,
                fontSize: 16,
                color: appColor,
                textColor: white,
                end: 10,
                circularRadius: 8,
                start: 10,
                height: height,
                width: width,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MpinScreen()));
                }),
            const Spacer(),
            const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Row(
                        children: [
                          Text(
                            "Didn’t receive it? Retry in ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: Manrope,
                                color: greayLightColor),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "29 sec",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: Manrope,
                                color: appColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
