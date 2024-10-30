//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/my_booking/confirmed_screen.dart';
import 'package:maideaze/ui/profile_screens/setting_screen.dart';
import 'package:maideaze/ui/profile_screens/support/query_chat_pro.dart';
import 'package:maideaze/ui/profile_screens/support/query_chat_res.dart';
import 'package:maideaze/ui/splash_screen.dart';
import 'package:maideaze/ui/top_helpers/nearest_screen.dart';
import 'package:maideaze/ui/top_helpers/top_helper.dart';

import '../favorites_screen/fav_screen.dart';
import '../helper details/helper_description.dart';
import '../helper details/helper_detailed.dart';
import '../home_screen/home_page.dart';
import '../login_screens/login_otp.dart';
import '../login_screens/login_screen.dart';
import '../mpin_screen/mpin_screen.dart';
import '../my_booking/add_coupon.dart';
import '../my_booking/coupon_sent_request.dart';
import '../my_booking/current_booking_cancelled.dart';
import '../my_booking/current_booking_completed.dart';
import '../my_booking/current_booking_ongoing.dart';
import '../my_booking/my_booking.dart';
import '../my_booking/replace_service_provider.dart';
import '../my_booking/sent_request_booking.dart';
import '../notification/notification.dart';
import '../notification/notification_filter_screen.dart';
import '../onboardingScreens/onboarding.dart';
import '../profile_screens/aboutus_screen.dart';
import '../profile_screens/anti_policy_screen.dart';
import '../profile_screens/attendance/attendance_screen.dart';
import '../profile_screens/attendance/leave_details.dart';
import '../profile_screens/document_screen/document_screen.dart';
import '../profile_screens/manage_address/add_new_address.dart';
import '../profile_screens/manage_address/manage_address.dart';
import '../profile_screens/privacy_policy_screen.dart';
import '../profile_screens/profile_screen.dart';
import '../profile_screens/service_guidlines_screen.dart';
import '../profile_screens/support/faq_detailes.dart';
import '../profile_screens/support/faq_screen.dart';
import '../profile_screens/support/help_center.dart';
import '../profile_screens/support/query_screen.dart';
import '../profile_screens/support/support_screen.dart';
import '../profile_screens/update_profile/update_profile_screen.dart';
import '../profile_screens/verify/police_varification_screen.dart';
import '../profile_screens/verify/verify_screen.dart';
import '../profile_screens/wallet/wallet_screen.dart';
import '../review_screen/review_screen.dart';
import '../search_screen/searchScreen.dart';
import '../select_location/select_location.dart';

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
  static const addcoupon = '/addcoupon';
  static const couponsentrequest = '/couponsentrequest';
  static const sentrequestbooking = '/sentrequestbooking';
  static const updateprofile = '/updateprofile';
  static const manageaddress = '/manageaddress';
  static const addnewaddress = '/addnewaddress';
  static const mywallet = '/mywallet';
  static const attendancescreen = '/attendancescreen';
  static const leavedetailes = '/leavedetailes';
  static const verifyscreen = '/verifyscreen';
  static const policeverification = '/policeverification';
  static const supportscreen = '/supportscreen';
  static const helpcenter = '/helpcenter';
  static const queryscreen = '/queryscreen';
  static const faqsscreen = '/faqscreen';
  static const faqdetailes = '/faqdetailes';
  static const serviceguidlines = '/serviceguidlines';
  static const antipolicy = '/antipolicy';
  static const privacypolicy = '/privacypolicy';
  static const aboutus = '/aboutus';
  static const settingscreen = '/settingscreen';
  static const querychatpro = '/querychatpro';
  static const querychatres = '/querychatres';
  static const confirmedscreen = '/confirmedscreen';
  static String currentRoute = splash;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? "";

    switch (routeSettings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => SplashScreen());
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
      case addcoupon:
        return CupertinoPageRoute(builder: (context) => const AddCoupon());
      case couponsentrequest:
        return CupertinoPageRoute(
            builder: (context) => const couponSentRequestBooking());
      case sentrequestbooking:
        return CupertinoPageRoute(
            builder: (context) => const SentRequestBooking());
      case updateprofile:
        return CupertinoPageRoute(builder: (context) => const UpdateProfile());
      case manageaddress:
        return CupertinoPageRoute(builder: (context) => const ManageAddress());
      case addnewaddress:
        return CupertinoPageRoute(builder: (context) => const AddNewAddress());
      case mywallet:
        return CupertinoPageRoute(builder: (context) => const WalletScreen());
      case attendancescreen:
        return CupertinoPageRoute(builder: (context) => AttendanceScreen());
      case leavedetailes:
        return CupertinoPageRoute(builder: (context) => LeaveDetailed());
      case verifyscreen:
        return CupertinoPageRoute(builder: (context) => VerifyScreen());
      case policeverification:
        return CupertinoPageRoute(builder: (context) => PoliceVeriScreen());
      case supportscreen:
        return CupertinoPageRoute(builder: (context) => SupportScreen());
      case helpcenter:
        return CupertinoPageRoute(builder: (context) => HelpCenter());
      case queryscreen:
        return CupertinoPageRoute(builder: (context) => QueryScreen());
      case faqsscreen:
        return CupertinoPageRoute(builder: (context) => FaqScreen());
      case faqdetailes:
        return CupertinoPageRoute(builder: (context) => FaqDetailes());
      case serviceguidlines:
        return CupertinoPageRoute(
            builder: (context) => ServiceGuidlinesScreen());
      case antipolicy:
        return CupertinoPageRoute(builder: (context) => AntiPolicyScreen());
      case privacypolicy:
        return CupertinoPageRoute(builder: (context) => PrivacyPolicyScreen());
      case aboutus:
        return CupertinoPageRoute(builder: (context) => AboutusScreen());
      case settingscreen:
        return CupertinoPageRoute(builder: (context) => SettingsScreen());
      case confirmedscreen:
        return CupertinoPageRoute(builder: (context) => ConfirmedScreen());
      case querychatres:
        return CupertinoPageRoute(builder: (context) => QueryChatRes());

      case querychatpro:
        return CupertinoPageRoute(builder: (context) => QueryChatPro());

      default:
        return CupertinoPageRoute(builder: (context) => const SizedBox());
    }
  }
}
