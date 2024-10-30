import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';

import 'package:maideaze/ui/my_booking/current_mybooking/confirmed_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

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
      resizeToAvoidBottomInset: true,
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF3F3F3),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms & Conditions",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
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
            const SizedBox(height: 36),
            const Text(
              "Select Reason",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildCustomCheckboxRow(
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
              value: reason1,
              onChanged: (bool? value) {
                setState(() {
                  reason1 = value ?? false;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildCustomCheckboxRow(
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
              value: reason2,
              onChanged: (bool? value) {
                setState(() {
                  reason2 = value ?? false;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildCustomCheckboxRow(
              text: 'Other Reason',
              value: others,
              onChanged: (bool? value) {
                setState(() {
                  others = value ?? false;
                });
              },
            ),
            if (others)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                            DesignConfig.setPngPath(drag_icon),
                            height: 12,
                            width: 12,
                          ),
                        ),
                        hintText: "Write something",
                        hintStyle: const TextStyle(
                            fontFamily: Manrope,
                            color: Color(0xffC4C4C4),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: greyLight)),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfirmedScreen()));
          },
        ),
      ),
    );
  }

  Widget _buildCustomCheckboxRow({
    required String text,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: appColor,
                width: 2,
              ),
              color: value ? appColor : Colors.transparent,
            ),
            width: 16,
            height: 16,
            child: value
                ? const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: Manrope,
              color: black,
            ),
          ),
        ),
      ],
    );
  }
}
