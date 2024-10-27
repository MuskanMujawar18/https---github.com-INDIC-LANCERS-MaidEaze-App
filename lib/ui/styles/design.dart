import 'package:flutter/material.dart';
import 'package:maideaze/ui/utils/constansts.dart';

import 'color.dart';

class DesignConfig {
  static RoundedRectangleBorder setRoundedBorderCard(
      double radius1, double radius2, double radius3, double radius4) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius1),
            bottomRight: Radius.circular(radius2),
            topLeft: Radius.circular(radius3),
            topRight: Radius.circular(radius4)));
  }

  static RoundedRectangleBorder setRoundedBorder(
      Color borderColor, double radius, bool isSetSide) {
    return RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
        borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder setRounded(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder setHalfRoundedBorder(
      Color borderColor,
      double radius1,
      double radius2,
      double radius3,
      double radius4,
      bool isSetSide) {
    return RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius1),
            bottomLeft: Radius.circular(radius2),
            topRight: Radius.circular(radius3),
            bottomRight: Radius.circular(radius4)));
  }

  static BoxDecoration boxDecorationContainerRoundHalf(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
    );
  }

  static BoxDecoration boxDecorationContainerShadow(
      Color color,
      double bradius1,
      double bradius2,
      double bradius3,
      double bradius4,
      BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onBackground,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        BoxShadow(
            color: color,
            offset: const Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static OutlineInputBorder outlineInputBorder(Color color, double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static BoxDecoration boxDecorationContainerHalf(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)),
    );
  }

  static BoxDecoration boxDecorationContainerBorder(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerBorderCustom(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color, width: 0.5),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationCircle(
      Color color, Color colorBackground, double radius) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color, width: 2.0),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration circle(Color color) {
    return BoxDecoration(shape: BoxShape.circle, color: color);
  }

  static setSvgPath(String name) {
    return "assets/images/svg/$name.svg";
  }

  static setPngPath(String name) {
    return "assets/images/png/$name.png";
  }

  static setLottiePath(String name) {
    return "assets/images/json/$name.json";
  }

  static BoxDecoration boxCurveShadow(Color? color) {
    return BoxDecoration(
        color: color!,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: greyLight,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -9),
          )
        ]);
  }

  static BoxDecoration boxDecorationContainerCardShadow(
      Color color,
      Color shadowColor,
      double radius,
      double x,
      double y,
      double b,
      double s) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: shadowColor,
            offset: Offset(x, y),
            blurRadius: b,
            spreadRadius: s),
      ],
    );
  }

  static BoxDecoration boxDecorationContainerShadow1(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onBackground,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
            color: Color(0x0f292929),
            offset: Offset(0.0, 6.0),
            blurRadius: 10.0,
            spreadRadius: 0)
      ],
    );
  }

  static InputDecoration inputDecorationextField(
      String lableText, String hintText, double width, BuildContext context,
      {Widget? suffix}) {
    return InputDecoration(
      suffixIcon: suffix,
      labelText: lableText,
      border: InputBorder.none,
      hintText: hintText,
      labelStyle: const TextStyle(
        color: greayLightColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: greayLightColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsetsDirectional.only(start: width / 20.0),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: greayLightColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.0, color: Theme.of(context).colorScheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.0, color: Theme.of(context).colorScheme.primary),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: greayLightColor),
      ),
    );
  }

  static imageWidgets(
      String? image, double? height, double? width, String? imageStatus) {
    return (image != "" && image!.isNotEmpty)
        ? FadeInImage(
            placeholder: AssetImage(
              DesignConfig.setPngPath('placeholder_square'),
            ),
            image: (imageStatus == "1")
                ? AssetImage(
                    DesignConfig.setPngPath(image),
                  )
                : NetworkImage(
                    image,
                  ) as ImageProvider,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                DesignConfig.setPngPath('placeholder_square'),
                height: height,
                width: width,
                fit: BoxFit.cover,
              );
            },
            placeholderErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                DesignConfig.setPngPath('placeholder_square'),
                height: height,
                width: width,
                fit: BoxFit.cover,
              );
            },
            height: height!,
            width: width!,
            fit: BoxFit.cover,
          )
        : Image.asset(
            DesignConfig.setPngPath('placeholder_square'),
            height: height!,
            width: width!,
            fit: BoxFit.cover,
          );
  }

  static Widget dropDownA(
      List<String> _dropdownOptions,
      String _selectedValue,
      void Function(String?)? onChanged,
      String hintText,
      double width,
      double height) {
    return Container(
      width: width / 1.5,
      padding: EdgeInsets.only(top: 20.0),
      child: DropdownButtonFormField<String>(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color(0xff818181),
            size: 20,
          ),
          hint: Text(
            hintText,
            style: TextStyle(
                color: Color(0xff818181),
                fontSize: 16,
                fontFamily: latoFont,
                fontWeight: FontWeight.w400),
          ),
          value: _selectedValue.isEmpty ? null : _selectedValue,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)), // Border on all sides
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff818181), width: 0), // Border color and width
            ),
          ),
          items: _dropdownOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged),
    );
  }

  static appBarWihoutBackbutton(
      BuildContext context, double? width, String? text, bottom) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.secondary, //change your color here
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      shadowColor: Theme.of(context).colorScheme.onBackground,
      elevation: 0,
      centerTitle: true,
      title: Text(text!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      bottom: bottom,
    );
  }

  static Divider divider() {
    return const Divider(color: greayLightColor, height: 0.2, thickness: 0.2);
  }

  static Widget getCenterWidget(
      {required String img,
      required String lbl,
      required String subLbl,
      required double width,
      required double height}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          DesignConfig.setPngPath(img),
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 25,
        ),
        Text(lbl,
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 0.2,
                fontFamily: latoFont,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff111827))),
        SizedBox(
          height: 10,
        ),
        Text(subLbl,
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 0.2,
                fontFamily: latoFont,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff6B7280))),
      ],
    );
  }
}
