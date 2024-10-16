import 'package:flutter/cupertino.dart';
import 'package:maideazw/ui/home_screen/home_page.dart';
import 'package:maideazw/ui/login_otp_screens/login_otp.dart';
import 'package:maideazw/ui/login_otp_screens/login_screen.dart';
import 'package:maideazw/ui/mpin_screen/mpin_screen.dart';
import 'package:maideazw/ui/onboardingScreens/onboarding.dart';
import 'package:maideazw/ui/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const onboardingsecond = '/onboardingsecond';
  static const onboardingthird = '/onboardingthird';
  static const loginpage = '/loginpage';
  static const otppage = '/otppage';
  static const mpinscreen = '/mpinscreen';
  static const homepage = '/homepage';
  static const putlocation = '/putlocation';
  static const selectpin = '/selectpin';
  static const selectrole = '/selectrole';
  static String currentRoute = splash;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? "";

    switch (routeSettings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case onboarding:
        return CupertinoPageRoute(
            builder: (context) => const OnboardingScreen());
      case loginpage:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
      case otppage:
        return CupertinoPageRoute(builder: (context) => LoginOtpScreen());
      case mpinscreen:
        return CupertinoPageRoute(builder: (context) => MpinScreen());
      case homepage:
        return CupertinoPageRoute(builder: (context) => HomePage());
      // case putlocation:
      //   return CupertinoPageRoute(builder: (context) => EnterLocation());
      // case selectpin:
      //   return CupertinoPageRoute(builder: (context) => EnterMpin());
      // case selectrole:
      //   return CupertinoPageRoute(builder: (context) => SelectRole());
      // case homepage:
      //   return CupertinoPageRoute(builder: (context) => HomePage());
      default:
        return CupertinoPageRoute(builder: (context) => const SizedBox());
    }
  }
}
