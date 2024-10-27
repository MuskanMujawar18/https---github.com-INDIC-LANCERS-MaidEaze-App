import 'package:flutter/material.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';

Widget ServiceProvider(
  final String name,
  final String distance,
  final double rating,
  final String info,
  final String imageUrl,
  final String rank,
) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: greayColor)),
    child: ListTile(
      leading: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            DesignConfig.setPngPath(imageUrl),
            height: 57,
            width: 61,
          )),
      title: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: Manrope,
              fontSize: 12,
              color: black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          if (rank == 'gold') ...[
            Image.asset(
              DesignConfig.setPngPath(crown_golden),
              height: 12,
              width: 12,
            )
          ] else if (rank == 'silver') ...[
            Image.asset(
              DesignConfig.setPngPath(crown_silver),
              height: 12,
              width: 12,
            )
          ],
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 3,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Image.asset(
                  DesignConfig.setPngPath(location_outlined),
                  height: 10,
                  width: 10,
                  color: greayLightColor,
                ),
                Text(
                  ' $distance away',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: greayLightColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                info,
                style: const TextStyle(
                    fontFamily: Manrope,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: greayLightColor),
              )),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 153, 0, 0.15),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  DesignConfig.setPngPath(star),
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '$rating',
                  style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFF9900)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
      onTap: () {},
    ),
  );
}
