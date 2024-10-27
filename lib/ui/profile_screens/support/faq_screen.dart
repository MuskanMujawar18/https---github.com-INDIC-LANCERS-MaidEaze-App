import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/profile_screens/support/faq_detailes.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: faqsLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          children: [
            faqContainer(
                "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem ",
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FaqDetailes()));
            }),
            const SizedBox(
              height: 18,
            ),
            faqContainer(
                "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem ",
                () {}),
            const SizedBox(
              height: 18,
            ),
            faqContainer(
                "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem ",
                () {}),
            const SizedBox(
              height: 18,
            ),
            faqContainer(
                "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem ",
                () {}),
          ],
        ),
      ),
    );
  }

  Widget faqContainer(String Faq, final VoidCallback? onTapped) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: greayColor),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Text(
              Faq,
              style: const TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 16,
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
