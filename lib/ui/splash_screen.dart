import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/app/routes.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  late double width, height;

  @override
  initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  String userId = "";
  void navigateToNextScreen() async {
    Navigator.pushReplacementNamed(context, Routes.onboarding);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    Timer(const Duration(seconds: 3), () {
      navigateToNextScreen();
    });
    return const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: appColor,
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appnameLbl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: Pacifico,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2)),
              ],
            ),
          ),
        ));
  }
}
