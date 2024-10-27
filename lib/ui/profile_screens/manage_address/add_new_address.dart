import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/profile_screens/profile_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() {
    return _AddNewAddressState();
  }
}

class _AddNewAddressState extends State<AddNewAddress> {
  double? height, width;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _housenoController = TextEditingController();
  final TextEditingController _addlineoneController = TextEditingController();
  final TextEditingController _addlinetwoController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  void dispose() {
    _titleController.dispose();
    _housenoController.dispose();
    _addlineoneController.dispose();
    _addlinetwoController.dispose();
    _pincodeController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  bool get isFormValid {
    return _titleController.text.isNotEmpty &&
        _housenoController.text.isNotEmpty &&
        _addlineoneController.text.isNotEmpty &&
        _addlinetwoController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty &&
        _landmarkController.text.isNotEmpty;
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: addnewaddLbl,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileTextField("Title", _titleController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField(
                          "House No. / Flat No.", _housenoController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Address Line 1", _addlineoneController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Address Line 2", _addlinetwoController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Pin Code", _pincodeController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Landmark", _landmarkController),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: height! / 7,
                      ),
                      ButtonContainer(
                        top: 8,
                        status: false,
                        borderColor: isFormValid ? appColor : Color(0xffB5E4CA),
                        bottom: 5,
                        text: updateLbl,
                        fontSize: 16,
                        color: isFormValid ? appColor : Color(0xffB5E4CA),
                        textColor: white,
                        end: 0,
                        circularRadius: 8,
                        start: 0,
                        height: height,
                        width: width,
                        onPressed: isFormValid
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()));
                              }
                            : null,
                      )
                    ]))));
  }

  Widget profileTextField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: Manrope,
          ),
        ),
        TextField(
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: black,
            fontFamily: Manrope,
          ),
          decoration: InputDecoration(
              hintText: "Type here",
              isDense: true,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: Manrope,
                  color: Color(0xffC4C4C4))),
        ),
      ],
    );
  }
}
