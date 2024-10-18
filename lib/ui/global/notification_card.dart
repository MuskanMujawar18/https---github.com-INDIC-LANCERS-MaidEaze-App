import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';

class NotificationCard extends StatelessWidget {
  final String request;
  final String duration;
  final String moredetailed;
  final String imageUrl;

  const NotificationCard({
    Key? key,
    this.request = "", // Default value to empty string
    this.duration = "", // Default value to empty string
    this.moredetailed = "", // Default value to empty string
    this.imageUrl = "", // Default value to empty string
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
                : Icon(Icons.image, size: 40)), // Add default placeholder
        title: Row(
          children: [
            Text(
              request,
              style: const TextStyle(
                fontFamily: Manrope,
                fontSize: 10,
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              duration,
              style: const TextStyle(
                fontFamily: Manrope,
                fontSize: 10,
                color: greayLightColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        subtitle: Align(
          alignment: Alignment.topLeft,
          child: Text(
            moredetailed,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: Manrope,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: greayLightColor,
            ),
          ),
        ),
        onTap: () {
          // Handle card tap if necessary
        },
      ),
    );
  }
}
