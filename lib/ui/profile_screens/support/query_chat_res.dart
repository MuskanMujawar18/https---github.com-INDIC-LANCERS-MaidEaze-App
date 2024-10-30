import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';

class QueryChatRes extends StatelessWidget {
  const QueryChatRes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: "",
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Title of Query",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: lightgreen),
                    child: Text(
                      "Resolved",
                      style: TextStyle(
                          fontFamily: Manrope,
                          color: appColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Text(
                "14776853",
                style: TextStyle(
                    fontFamily: Manrope,
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 24,
              ),
              queryProfile(
                  pro_image_ellipse, "Akshita Singh", "12/05/24,", "08:57 PM"),
              const SizedBox(
                height: 10,
              ),
              queryChatContainer(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
              const SizedBox(
                height: 10,
              ),
              queryChatContainer("Lorem _Ipsum.jpeg"),
              const SizedBox(
                height: 24,
              ),
              queryProfile(null, "MaidEaze Support", "12/05/24,", "08:57 PM"),
              const SizedBox(
                height: 10,
              ),
              queryChatContainer(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
              const SizedBox(
                height: 10,
              ),
              queryChatContainer(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
            ],
          ),
        ),
      ),
    );
  }

  Widget queryChatContainer(String chat) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xffF3F3F3)),
      child: Text(
        chat,
        style: const TextStyle(
            fontFamily: Manrope,
            color: black,
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget queryProfile(String? imageUrl, String name, String date, String time) {
    return Row(
      children: [
        imageUrl == null
            ? Container(
                height: 32,
                width: 32,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: appColor),
              )
            : Image.asset(DesignConfig.setPngPath(imageUrl),
                height: 32, width: 32),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$date $time",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: greayLightColor),
            )
          ],
        )
      ],
    );
  }
}
