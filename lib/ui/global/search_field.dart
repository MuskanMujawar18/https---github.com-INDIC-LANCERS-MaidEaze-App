import 'package:flutter/material.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final Function(BuildContext) onPressed;

  const CustomSearchField(
      {super.key, required this.hintText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: greayColor,
          ),
        ),
        child: TextField(
          readOnly: false,
          onTap: () => onPressed(context),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
              child: Image.asset(
                DesignConfig.setPngPath("search"),
                color: Colors.grey,
                height: 20,
                width: 20,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Color(0xffC4C4C4),
                fontFamily: Manrope,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
