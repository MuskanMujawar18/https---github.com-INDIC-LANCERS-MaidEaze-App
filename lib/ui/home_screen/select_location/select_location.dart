import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/search_field.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() {
    return _SelectLocationState();
  }
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: locationmanualyLbl,
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CustomSearchField(
                hintText: "Enter your area, or apartment name",
                onPressed: (ctx) {
                  // Navigator.push(
                  //     ctx,
                  //     MaterialPageRoute(
                  //         builder: (ctx) => const SelectLocation()));
                }),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              Image.asset(
                DesignConfig.setPngPath(send_icon),
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Use my current location",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: appColor,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Row(children: [
              Icon(
                Icons.add,
                size: 20,
                color: appColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Add New Address",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: appColor,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 0.5,
              color: greayLightColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Saved Addresses",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 10,
                    color: greayLightColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: greayColor, width: 0.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(home_icon),
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Manrope',
                              ),
                            ),
                            Text(
                              'XYZ, Building name, City, State, etc.',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: greayLightColor,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          DesignConfig.setPngPath(building_icon),
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Office',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Manrope',
                              ),
                            ),
                            Text(
                              'XYZ, Building name, City, State, etc.',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: greayLightColor,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
