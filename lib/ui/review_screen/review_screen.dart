import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/global/common_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  Widget build(BuildContext context) {
    double? height, width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: reviewLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Give review by category wise",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: Manrope),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: greayColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Behaviour",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: Manrope),
                        ),
                        const Spacer(),
                        rating(),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Punctuality on time",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: Manrope),
                        ),
                        const Spacer(),
                        rating(),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          "Cleaning Service",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: Manrope),
                        ),
                        const Spacer(),
                        rating(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Center(
                child: Text(
                  "How was your overall experience?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: Manrope),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("star"),
                    height: 22.77,
                    width: 24,
                  ),
                  Image.asset(
                    DesignConfig.setPngPath("star"),
                    height: 22.77,
                    width: 24,
                  ),
                  Image.asset(
                    DesignConfig.setPngPath("star"),
                    height: 22.77,
                    width: 24,
                  ),
                  Image.asset(
                    DesignConfig.setPngPath("star_outlined"),
                    height: 22.77,
                    width: 24,
                  ),
                  Image.asset(
                    DesignConfig.setPngPath("star_outlined"),
                    height: 22.77,
                    width: 24,
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Text(
                "Add a comment (Optional)",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: Manrope),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: null,
                minLines: 3,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 70.0, left: 25),
                      child: Image.asset(
                        DesignConfig.setPngPath("drag_icon"),
                        height: 12,
                        width: 12,
                      ),
                    ),
                    hintText: "Write something",
                    hintStyle: const TextStyle(
                        fontFamily: Manrope,
                        color: Color(0xffC4C4C4),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: greyLight))),
              ),
              const SizedBox(height: 200),
              ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 5,
                text: submitLbl,
                fontSize: 16,
                color: appColor,
                textColor: white,
                end: 0,
                circularRadius: 8,
                start: 0,
                height: height,
                width: width,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommonScreen(
                        imagePath: "feedback_image",
                        title: "  Thanks for giving your feedback",
                        titleFontWeight: FontWeight.w600,
                        titlefontSize: 24,
                        titlefontColor: black,
                        subtitle:
                            "Your feedback means a lot for rating and improvement for our services",
                        subtitleFontWeight: FontWeight.w500,
                        sutitleFontSize: 12,
                        subtitlefontColor: greayLightColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rating() {
    return Row(
      children: [
        Image.asset(
          DesignConfig.setPngPath("star"),
          height: 16,
          width: 16,
        ),
        Image.asset(
          DesignConfig.setPngPath("star"),
          height: 16,
          width: 16,
        ),
        Image.asset(
          DesignConfig.setPngPath("star"),
          height: 16,
          width: 16,
        ),
        Image.asset(
          DesignConfig.setPngPath("star"),
          height: 16,
          width: 16,
        ),
        Image.asset(
          DesignConfig.setPngPath("star_outlined"),
          height: 16,
          width: 16,
        ),
      ],
    );
  }
}
