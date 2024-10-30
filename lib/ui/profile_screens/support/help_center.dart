import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    double? height, width;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: helpcenterLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Admin",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Write Query title",
                  hintStyle: const TextStyle(
                      fontFamily: Manrope,
                      color: Color(0xffC4C4C4),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: greyLight)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: null,
              minLines: 3,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 70.0, left: 25),
                    child: Image.asset(
                      DesignConfig.setPngPath(drag_icon),
                      height: 12,
                      width: 12,
                    ),
                  ),
                  hintText: "Write description",
                  hintStyle: const TextStyle(
                      fontFamily: Manrope,
                      color: Color(0xffC4C4C4),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: greyLight))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.attach_file_outlined,
                    size: 20,
                    color: Color(0xffB0B0B0),
                  ),
                  hintText: "Add Attachment (Optional)",
                  hintStyle: const TextStyle(
                      fontFamily: Manrope,
                      color: Color(0xffC4C4C4),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: greyLight)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            ),
            const Spacer(),
            ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 5,
                text: sendrequestLbl,
                fontSize: 16,
                color: appColor,
                textColor: white,
                end: 0,
                circularRadius: 8,
                start: 0,
                height: height,
                width: width,
                onPressed: () async {})
          ],
        ),
      ),
    );
  }
}
