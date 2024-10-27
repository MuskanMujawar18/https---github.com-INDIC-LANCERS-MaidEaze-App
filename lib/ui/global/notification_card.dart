import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';

class NotificationCard extends StatelessWidget {
  final String request;
  final String duration;
  final String moredetailed;
  final Color? moredetailedColor;
  final String imageUrl;

  const NotificationCard({
    Key? key,
    this.request = "",
    this.duration = "",
    this.moredetailed = "",
    required this.moredetailedColor,
    this.imageUrl = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      // padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greayColor)),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: imageUrl.isNotEmpty
                ? Image.asset(
                    DesignConfig.setPngPath(imageUrl),
                    height: 48,
                    width: 48,
                  )
                : Icon(Icons.image, size: 40)),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: request,
                style: const TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' $duration',
                style: const TextStyle(
                  fontFamily: Manrope,
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        subtitle: Align(
          alignment: Alignment.topLeft,
          child: Text(
            moredetailed,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: Manrope,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: moredetailedColor,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
