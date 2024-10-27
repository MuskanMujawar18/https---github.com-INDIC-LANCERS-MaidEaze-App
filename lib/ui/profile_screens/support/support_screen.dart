import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/profile_screens/support/faq_screen.dart';
import 'package:maideaze/ui/profile_screens/support/help_center.dart';
import 'package:maideaze/ui/profile_screens/support/query_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: supportLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              DesignConfig.setPngPath(support_image),
              height: 218,
            ),
            const SizedBox(
              height: 12,
            ),
            supportContent(whatsapp, "Chat with Us", () {}),
            const SizedBox(
              height: 15,
            ),
            supportContent(message_edit_icon, "Help Center", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpCenter()));
            }),
            const SizedBox(
              height: 15,
            ),
            supportContent(user_edit_icon, "Your Queries", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QueryScreen()));
            }),
            const SizedBox(
              height: 15,
            ),
            supportContent(support, "FAQs", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FaqScreen()));
            })
          ],
        ),
      ),
    );
  }

  Widget supportContent(
      String imagePath, String content, final VoidCallback? onTapped) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
