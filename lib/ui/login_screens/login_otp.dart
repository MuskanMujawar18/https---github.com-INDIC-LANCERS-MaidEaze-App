import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/home_screen/home_page.dart';
import 'package:maideaze/ui/mpin_screen/mpin_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';
import 'package:maideaze/ui/utils/stringRes.dart';
import 'package:maideaze/ui/utils/uiutils.dart';

class LoginOtpScreen extends StatefulWidget {
  String verificationid;
  LoginOtpScreen({super.key, required this.verificationid});

  @override
  State<LoginOtpScreen> createState() {
    return _LoginOtpScreenState();
  }
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  double? height, width;
  TextEditingController otpController = TextEditingController();

  Timer? _timer;
  int _start = 120;
  bool _isResendEnabled = false;
  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isResendEnabled = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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
                                controller: otpController,
                                maxLength: 6,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: greyLight,
                                    counterText: "",
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
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpController.text.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  } catch (ex) {
                    //log(ex.toString())
                  }

                  // verifyOTP();
                  // if (_otpController.text.isEmpty) {
                  //   UiUtils.setSnackBar(
                  //       "", StringsRes.fieldEmptyError, context, false,
                  //       type: "2");
                  // } else {
                  //   PhoneAuthCredential credential =
                  //       PhoneAuthProvider.credential(
                  //           verificationId: LoginScreen.verify,
                  //           smsCode: _otpController.text);

                  //   // Sign the user in (or link) with the credential
                  //   await auth.signInWithCredential(credential);
                  //   Navigator.push(
                  //       context,
                  //       CupertinoPageRoute(
                  //           builder: (context) => const MpinScreen()));
                  // }
                }),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40),
              child: GestureDetector(
                  onTap: _isResendEnabled
                      ? () async {
                          setState(() {
                            _start = 120; // Reset timer
                            _isResendEnabled = false;
                          });
                          _startTimer();
                          verifyOTP();
                          // send Otp again
                        }
                      : null,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      const Text(
                        "Didn’t receive it? Retry in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff7B7B7B),
                            fontSize: 12,
                            fontFamily: Manrope,
                            //letterSpacing: 0.06,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        _isResendEnabled
                            ? resendOtp
                            : "${_formatTime(_start)} Sec",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: appColor,
                            fontSize: 12,
                            fontFamily: Manrope,
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }

  bool _isFieldFilled() {
    return otpController.text.isNotEmpty;
  }

  void verifyOTP() async {
    try {
      if (_isFieldFilled()) {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const MpinScreen()));
      } else {
        UiUtils.setSnackBar("", StringsRes.fieldEmptyError, context, false,
            type: "2");
      }
    } catch (e) {
      rethrow;
    }
  }
}
