import 'package:flutter/cupertino.dart';
import 'package:maideazw/ui/favorites_screen/fav_screen.dart';
import 'package:maideazw/ui/helper%20details/helper_description.dart';
import 'package:maideazw/ui/helper%20details/helper_detailed.dart';
import 'package:maideazw/ui/home_screen/home_page.dart';
import 'package:maideazw/ui/login_screens/login_otp.dart';
import 'package:maideazw/ui/login_screens/login_screen.dart';
import 'package:maideazw/ui/mpin_screen/mpin_screen.dart';
import 'package:maideazw/ui/my_booking/current_booking_ongoing.dart';
import 'package:maideazw/ui/my_booking/my_booking.dart';
import 'package:maideazw/ui/my_booking/current_booking_cancelled.dart';
import 'package:maideazw/ui/my_booking/current_booking_completed.dart';
import 'package:maideazw/ui/my_booking/replace_service_provider.dart';
import 'package:maideazw/ui/notification/notification.dart';
import 'package:maideazw/ui/notification/notification_filter_screen.dart';
import 'package:maideazw/ui/onboardingScreens/onboarding.dart';
import 'package:maideazw/ui/profile_screens/document_screen.dart';
import 'package:maideazw/ui/profile_screens/profile_screen.dart';
import 'package:maideazw/ui/review_screen/review_screen.dart';
import 'package:maideazw/ui/search_screen/searchScreen.dart';
import 'package:maideazw/ui/select_location/select_location.dart';
import 'package:maideazw/ui/splash_screen.dart';
import 'package:maideazw/ui/top_helpers/top_helper.dart';
import 'package:maideazw/ui/top_helpers/nearest_screen.dart';

class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const loginpage = '/loginpage';
  static const otppage = '/otppage';
  static const mpinscreen = '/mpinscreen';
  static const homepage = '/homepage';
  static const selectlocation = '/selectlocation';
  static const searchscreen = '/searchscreen';
  static const tophelper = '/tophelper';
  static const notification = '/notification';
  static const notificationfilterscreen = '/notificationfilterscreen';
  static const nearestscreen = '/nearestscreen';
  static const helperdetailed = '/helperdetailed';
  static const helperdescription = '/helperdescription';
  static const mybooking = '/mybooking';
  static const currentbookingongoing = '/currentbookingongoing';
  static const currentbookingcompleted = '/currentbookingcompleted';
  static const currentbookingcancelled = '/currentbookingcancelled';
  static const favscreen = '/favscreen';
  static const profilescreen = '/profilescreen';
  static const documentscreen = '/documentscreen';
  static const replaceprovider = '/replaceprovider';
  static const reviewscreen = '/reviewscreen';
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
        return CupertinoPageRoute(builder: (context) => const LoginOtpScreen());
      case mpinscreen:
        return CupertinoPageRoute(builder: (context) => const MpinScreen());
      case homepage:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case selectlocation:
        return CupertinoPageRoute(builder: (context) => const SelectLocation());
      case notification:
        return CupertinoPageRoute(
            builder: (context) => const NotificationScreen());
      case searchscreen:
        return CupertinoPageRoute(builder: (context) => const SearchScreen());
      case notificationfilterscreen:
        return CupertinoPageRoute(
            builder: (context) => const NotificationFilterScreen());
      case tophelper:
        return CupertinoPageRoute(builder: (context) => const TopHelper());
      case nearestscreen:
        return CupertinoPageRoute(builder: (context) => const NearestScreen());
      case helperdescription:
        return CupertinoPageRoute(
            builder: (context) => const HelperDescription());
      case helperdetailed:
        return CupertinoPageRoute(builder: (context) => const HelperDetailed());
      case mybooking:
        return CupertinoPageRoute(builder: (context) => const MyBooking());
      case currentbookingongoing:
        return CupertinoPageRoute(
            builder: (context) => const CurrentBookingOngoing());
      case currentbookingcancelled:
        return CupertinoPageRoute(
            builder: (context) => const CurrentBookingCancelled());
      case currentbookingcompleted:
        return CupertinoPageRoute(
            builder: (context) => const CurrentBookingCompleted());
      case favscreen:
        return CupertinoPageRoute(builder: (context) => const FavScreen());
      case profilescreen:
        return CupertinoPageRoute(builder: (context) => const ProfileScreen());
      case documentscreen:
        return CupertinoPageRoute(builder: (context) => const DocumentScreen());
      case replaceprovider:
        return CupertinoPageRoute(
            builder: (context) => const ReplaceServiceProvider());
      case reviewscreen:
        return CupertinoPageRoute(builder: (context) => ReviewScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const SizedBox());
    }
  }
}
