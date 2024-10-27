import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/login_screens/login_otp.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';
import 'package:maideaze/ui/utils/stringRes.dart';
import 'package:maideaze/ui/utils/uiutils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = "";

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  double? height, width;
  final _phoneController = TextEditingController();

  Text _buildText(String text, FontWeight weight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: weight,
        fontFamily: 'Manrope',
        color: color,
      ),
    );
  }

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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white),
                      child: Column(children: [
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          welcomeLbl,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: Manrope),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          welcomesubLbl,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: Manrope,
                              color: greayLightColor),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enter your mobile number",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: Manrope,
                                  color: black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              // onChanged: (value) {
                              //   _phoneController.text = value;
                              // },
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
                  ),
                ),
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
              bottom: 8,
              text: "Get OTP",
              fontSize: 16,
              color: appColor,
              textColor: white,
              end: 10,
              circularRadius: 8,
              start: 10,
              height: height,
              width: width,
              onPressed: () async {
                sendOtp();
                // if (_phoneController.text.isEmpty) {
                //   return UiUtils.setSnackBar(
                //       "", StringsRes.fieldEmptyError, context, false,
                //       type: "2");
                // } else {
                //   // String phoneNumber = '+91${_phoneController.text}';

                //   // await FirebaseAuth.instance.verifyPhoneNumber(
                //   //   phoneNumber: phoneNumber,
                //   //   verificationCompleted: (PhoneAuthCredential credential) {},
                //   //   verificationFailed: (FirebaseAuthException e) {
                //   //     UiUtils.setSnackBar("",
                //   //         e.message ?? "Verification failed", context, false,
                //   //         type: "2");
                //   //   },
                //   //   codeSent: (String verificationId, int? resendToken) {
                //   //     LoginScreen.verify = verificationId;
                //   Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //           builder: (context) => const LoginOtpScreen()));
                //   //       },
                //   //       codeAutoRetrievalTimeout: (String verificationId) {},
                //   //     );
                // }
              },
            ),
            const Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildText("By proceeding, you agree with MaidEaze’s",
                          FontWeight.w400, greayLightColor),
                      const SizedBox(width: 3),
                      _buildText("terms and", FontWeight.w600, appColor),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildText("conditions", FontWeight.w600, appColor),
                        const SizedBox(width: 3),
                        _buildText("and", FontWeight.w400, greayLightColor),
                        const SizedBox(width: 3),
                        _buildText("privacy policy", FontWeight.w600, appColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void sendOtp() async {
    try {
      if (_phoneController.text.isEmpty) {
        UiUtils.setSnackBar("", StringsRes.fieldEmptyError, context, false,
            type: "2");
      } else {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const LoginOtpScreen()));
      }
    } catch (e) {
      rethrow;
    }
  }
}
