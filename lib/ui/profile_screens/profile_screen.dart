import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/botton_nav.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/profile_screens/document_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/imagesDefine.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  double? height, width;

  Widget build(BuildContext context) {
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
            Icons.settings, // Notification icon
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {},
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("pro_image_ellipse"),
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Akshita Singh",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "akshitasingh@gmail.com",
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
                  child: Column(
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath("wallet"),
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
                  child: Column(
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath("calendar"),
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
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            profileContent("document_upload", "My Documents", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DocumentScreen()));
            }),
            const SizedBox(
              height: 10,
            ),
            profileContent("location_outlined", "Manage Address", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("verify", "Verify My Maid", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("support", "Support", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("task", "Service Guidlines", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("security", "Anti-Discriminatory Policy", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("lock", "Privacy Policy", () {}),
            const SizedBox(
              height: 10,
            ),
            profileContent("info_circle", "About Us", () {}),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: greayColor)),
              child: Row(
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("logout"),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("refer_friend"),
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
}
