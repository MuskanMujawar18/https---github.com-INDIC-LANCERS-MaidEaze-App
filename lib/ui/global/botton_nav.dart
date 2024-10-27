import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/app/routes.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';

Widget BottomNav(
    {required String from,
    required double width,
    required double height,
    required BuildContext context}) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 8),
    // width: width,
    // height: height,
    decoration: const BoxDecoration(
      color: white,
      boxShadow: [
        BoxShadow(
          color: greyLight,
          spreadRadius: 1,
          blurRadius: 0,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        from == bottom_home
            ? returnNav(
                height: 200,
                width: 200,
                name: bottom_home_color,
                onTap: null,
              )
            : returnNav(
                height: 200,
                width: 200,
                name: bottom_home,
                onTap: () {
                  Future.delayed(Duration(milliseconds: 10), () {
                    Navigator.pushNamed(context, Routes.homepage,
                        arguments: {});
                  });
                }),
        from == bottom_booking
            ? returnNav(
                height: 200,
                width: 200,
                name: bottom_booking_color,
                onTap: null)
            : returnNav(
                height: 200,
                width: 200,
                name: bottom_booking,
                onTap: () {
                  Future.delayed(Duration(milliseconds: 10), () {
                    Navigator.pushNamed(context, Routes.mybooking,
                        arguments: {"from": "event"});
                  });
                }),
        from == bottom_fav
            ? returnNav(
                height: 200, width: 200, name: bottom_fav_color, onTap: null)
            : returnNav(
                height: 200,
                width: 200,
                name: bottom_fav,
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 10), () {
                    Navigator.pushNamed(context, Routes.favscreen,
                        arguments: {"from": "event"});
                  });
                }),
        from == bottom_profile
            ? returnNav(
                height: 200,
                width: 200,
                name: bottom_profile_color,
                onTap: null)
            : returnNav(
                height: 200,
                width: 200,
                name: bottom_profile,
                onTap: () {
                  Future.delayed(Duration(milliseconds: 10), () {
                    Navigator.pushNamed(context, Routes.profilescreen,
                        arguments: {});
                  });
                }),
      ],
    ),
  );
}

Widget returnNav(
    {required String name,
    required void Function()? onTap,
    required double width,
    required double height}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      DesignConfig.setPngPath(name),
      //color: black,
      height: width / 4.6,
      fit: BoxFit.fitHeight,
    ),
  );
}

Widget returnSelectedNav({required String name}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        DesignConfig.setPngPath(name),
        color: appColor,
        width: 85,
        height: 70,
        fit: BoxFit.fitHeight,
      ),
      // Image.asset(
      //   DesignConfig.setPngPath(selectedNav),
      //   width: 78,
      //   height: 6,
      //   fit: BoxFit.fill,
      // ),
    ],
  );
}
