import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  State<DocumentScreen> createState() {
    return _DocumentScreenState();
  }
}

class _DocumentScreenState extends State<DocumentScreen> {
  double? height, width;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: mydocumentLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Card(
              shadowColor: greayLightColor,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Electricity Bill",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffEBEBEB)),
                          child: Row(
                            children: [
                              Image.asset(
                                DesignConfig.setPngPath(document_upload),
                                height: 12,
                                width: 12,
                                color: black,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Upload File",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Filename.jpg",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 10,
                            color: appColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              shadowColor: greayLightColor,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Adhaar Card",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffEBEBEB)),
                          child: Row(
                            children: [
                              Image.asset(
                                DesignConfig.setPngPath(document_upload),
                                height: 12,
                                width: 12,
                                color: black,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Upload File",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Filename.jpg",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 10,
                            color: appColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 5,
                text: saveLbl,
                fontSize: 16,
                color: appColor,
                textColor: white,
                end: 0,
                circularRadius: 8,
                start: 0,
                height: height,
                width: width,
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HelperDetailed()));
                })
          ],
        ),
      ),
    );
  }
}
