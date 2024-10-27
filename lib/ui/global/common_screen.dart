import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';

class CommonScreen extends StatelessWidget {
  final String imagePath;
  final String? title;
  final double? titlefontSize;
  final FontWeight? titleFontWeight;
  final Color? titlefontColor;
  final String? subtitle;
  final double? sutitleFontSize;
  final FontWeight? subtitleFontWeight;
  final Color? subtitlefontColor;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const CommonScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.titlefontSize,
    required this.titleFontWeight,
    required this.titlefontColor,
    this.subtitle,
    this.sutitleFontSize,
    this.subtitleFontWeight,
    this.subtitlefontColor,
    this.buttonText,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height, width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 200),
                child: Image.asset(
                  DesignConfig.setPngPath(imagePath),
                  height: 200,
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titlefontSize,
                  fontWeight: titleFontWeight,
                  color: titlefontColor,
                  fontFamily: Manrope,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sutitleFontSize,
                      fontWeight: subtitleFontWeight,
                      color: subtitlefontColor,
                      fontFamily: Manrope,
                    ),
                  ),
                ),
              ],
              Spacer(),
              if (buttonText != null && onButtonPressed != null)
                ButtonContainer(
                  top: 8,
                  status: false,
                  borderColor: appColor,
                  bottom: 5,
                  text: buttonText!,
                  fontSize: 16,
                  color: appColor,
                  textColor: white,
                  end: 0,
                  circularRadius: 8,
                  start: 0,
                  height: height,
                  width: width,
                  onPressed: onButtonPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
