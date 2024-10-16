import 'package:flutter/material.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;

  const CustomSearchField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        //  color: Colors.grey[200], // Light grey background
        border: Border.all(
          color: greayColor, // Border color
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            DesignConfig.setPngPath("search"),
            color: Colors.grey,
            height: 20,
            width: 20,
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
    );
  }
}
