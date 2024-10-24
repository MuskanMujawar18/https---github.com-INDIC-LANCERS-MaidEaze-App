import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/global/common_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class ReplaceServiceProvider extends StatefulWidget {
  const ReplaceServiceProvider({super.key});

  @override
  State<ReplaceServiceProvider> createState() {
    return _ReplaceServiceProviderState();
  }
}

class _ReplaceServiceProviderState extends State<ReplaceServiceProvider> {
  double? height, width;
  bool reason1 = false;
  bool reason2 = false;
  bool others = false;
  TextEditingController _otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard opens
      appBar: CustomAppBar(
        title: replaceproviderLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms & Conditions",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Select Reason",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            CheckboxListTile(
              title: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: Manrope,
                    color: black),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: reason1,
              side: BorderSide(color: appColor, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onChanged: (bool? value) {
                setState(() {
                  reason1 = value ?? false;
                });
              },
              activeColor: appColor,
            ),
            CheckboxListTile(
              title: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: Manrope,
                    color: black),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: reason2,
              side: BorderSide(color: appColor, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onChanged: (bool? value) {
                setState(() {
                  reason2 = value ?? false;
                });
              },
              activeColor: appColor,
            ),
            CheckboxListTile(
              title: Text(
                'Other Reason',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: Manrope,
                    color: black),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: others,
              side: BorderSide(color: appColor, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onChanged: (bool? value) {
                setState(() {
                  others = value ?? false;
                });
              },
              activeColor: appColor,
            ),
            if (others)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Give Reason',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: Manrope,
                          color: black),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      maxLines: null,
                      minLines: 3,
                      controller: _otherReasonController,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 70.0, left: 25),
                          child: Image.asset(
                            DesignConfig.setPngPath("drag_icon"),
                            height: 12,
                            width: 12,
                          ),
                        ),
                        hintText: "Write something",
                        hintStyle: TextStyle(
                            fontFamily: Manrope,
                            color: Color(0xffC4C4C4),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: greyLight)),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20), // Extra space for better scrolling
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ButtonContainer(
          top: 8,
          status: false,
          borderColor: appColor,
          bottom: 5,
          text: submitndcontinueLbl,
          fontSize: 16,
          color: appColor,
          textColor: white,
          end: 0,
          circularRadius: 8,
          start: 0,
          height: height,
          width: width,
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CommonScreen(
                          imagePath: "request_send_image",
                          title: "Confirmed!",
                          titlefontSize: 32,
                          titleFontWeight: FontWeight.w600,
                          titlefontColor: black,
                          subtitle:
                              "Service provider is replaced.\nRefund amount will be added to your\nMaidEaze’s wallet.",
                          subtitleFontWeight: FontWeight.w500,
                          subtitlefontColor: greayLightColor,
                          sutitleFontSize: 12,
                        )));
          },
        ),
      ),
    );
  }
}
