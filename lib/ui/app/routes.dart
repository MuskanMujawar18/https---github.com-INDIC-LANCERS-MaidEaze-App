import 'package:flutter/cupertino.dart';
import 'package:maideazw/ui/home_screen/home_page.dart';
import 'package:maideazw/ui/login_otp_screens/login_otp.dart';
import 'package:maideazw/ui/login_otp_screens/login_screen.dart';
import 'package:maideazw/ui/mpin_screen/mpin_screen.dart';
import 'package:maideazw/ui/notification/notification.dart';
import 'package:maideazw/ui/notification/notification_filter_screen.dart';
import 'package:maideazw/ui/onboardingScreens/onboarding.dart';
import 'package:maideazw/ui/search_screen/searchScreen.dart';
import 'package:maideazw/ui/select_location/select_location.dart';
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
  static const selectlocation = '/selectlocation';
  static const searchscreen = '/searchscreen';
  static const selectrole = '/selectrole';
  static const notification = '/notification';
  static const notificationfilterscreen = '/notificationfilterscreen';
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
      case selectlocation:
        return CupertinoPageRoute(builder: (context) => SelectLocation());
      case notification:
        return CupertinoPageRoute(builder: (context) => NotificationScreen());
      case searchscreen:
        return CupertinoPageRoute(builder: (context) => SearchScreen());
      case notificationfilterscreen:
        return CupertinoPageRoute(
            builder: (context) => NotificationFilterScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const SizedBox());
    }
  }
}
