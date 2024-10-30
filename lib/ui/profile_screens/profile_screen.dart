import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/botton_nav.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/login_screens/login_screen.dart';
import 'package:maideaze/ui/profile_screens/aboutus_screen.dart';
import 'package:maideaze/ui/profile_screens/anti_policy_screen.dart';
import 'package:maideaze/ui/profile_screens/attendance/attendance_screen.dart';
import 'package:maideaze/ui/profile_screens/document_screen/document_screen.dart';
import 'package:maideaze/ui/profile_screens/manage_address/manage_address.dart';
import 'package:maideaze/ui/profile_screens/privacy_policy_screen.dart';
import 'package:maideaze/ui/profile_screens/service_guidlines_screen.dart';
import 'package:maideaze/ui/profile_screens/setting_screen.dart';
import 'package:maideaze/ui/profile_screens/support/support_screen.dart';
import 'package:maideaze/ui/profile_screens/update_profile/update_profile_screen.dart';
import 'package:maideaze/ui/profile_screens/verify/verify_screen.dart';
import 'package:maideaze/ui/profile_screens/wallet/wallet_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    void showLogOutPopup(context) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => logoutBottomsheet(context));
    }

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNav(
          from: bottom_profile,
          width: width!,
          height: height!,
          context: context),
      backgroundColor: white,
      appBar: CustomAppBar(
        title: "",
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
        rightIcon: IconButton(
          icon: const Icon(
            Icons.settings_outlined,
            color: black,
            size: 20,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(181, 228, 202, 0.25)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfile()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: greayColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User0123",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Update your profile",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: greayColor,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WalletScreen()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(wallet),
                          height: 24,
                          width: 24,
                          color: appColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "My Wallet",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: greayColor,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(calendar),
                          height: 24,
                          width: 24,
                          color: appColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Attendance",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            profileContent(document_upload, "My Documents", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DocumentScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(location_outlined, "Manage Address", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageAddress()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(verify, "Verify My Maid", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifyScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(support, "Support", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SupportScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(task, "Service Guidlines", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceGuidlinesScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(security, "Anti-Discriminatory Policy", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AntiPolicyScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(lock, "Privacy Policy", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent(info_circle, "About Us", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutusScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showLogOutPopup(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: greayColor)),
                child: Row(
                  children: [
                    Image.asset(
                      DesignConfig.setPngPath(logout),
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: const Color(0xffE50404),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: Manrope,
                        color: Color(0xffE50404),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    DesignConfig.setPngPath(refer_friend),
                    height: 211,
                    width: 252,
                  ),
                  const Text(
                    "Refer a Friend & Earn",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: Manrope,
                      color: black,
                    ),
                  ),
                  const Text(
                    "₹500",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: Manrope,
                      color: black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: greayLightColor),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Get",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: Manrope,
                              color: greayLightColor,
                            ),
                          ),
                          Text(
                            " ₹500",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: Manrope,
                              color: greayLightColor,
                            ),
                          ),
                          Text(
                            " cash prize after your friend’s 1st order.",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: Manrope,
                              color: greayLightColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: greayLightColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Your friend gets 50% off on their 1st order.",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: Manrope,
                          color: greayLightColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 5,
                text: referfrndLbl,
                fontSize: 16,
                color: appColor,
                textColor: white,
                end: 70,
                circularRadius: 8,
                start: 70,
                height: height,
                width: width,
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const NotificationFilterScreen()));
                })
          ]),
        ),
      ),
    );
  }

  Widget profileContent(
      String imagePath, String content, final VoidCallback? onTapped) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: greayColor)),
        child: Row(
          children: [
            Image.asset(
              DesignConfig.setPngPath(imagePath),
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Text(
              content,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                fontFamily: Manrope,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget logoutBottomsheet(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 174,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Logout",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              fontFamily: Manrope,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Are you sure you want to logout from the app?",
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              fontFamily: Manrope,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonContainer(
                  top: 8,
                  status: false,
                  borderColor: appColor,
                  bottom: 5,
                  text: cancelLbl,
                  fontSize: 16,
                  color: white,
                  textColor: appColor,
                  end: 0,
                  circularRadius: 8,
                  start: 00,
                  height: height! / 1.2,
                  width: width! / 3,
                  onPressed: () async {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                width: 5,
              ),
              ButtonContainer(
                  top: 8,
                  status: false,
                  borderColor: appColor,
                  bottom: 5,
                  text: logoutLbl,
                  fontSize: 16,
                  color: appColor,
                  textColor: white,
                  end: 00,
                  circularRadius: 8,
                  start: 00,
                  height: height! / 1.2,
                  width: width! / 3,
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  })
            ],
          )
        ]));
  }
}
