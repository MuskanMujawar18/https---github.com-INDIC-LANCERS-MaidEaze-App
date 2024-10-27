import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/profile_screens/profile_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() {
    return _UpdateProfileState();
  }
}

class _UpdateProfileState extends State<UpdateProfile> {
  double? height, width;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _mobilenoController = TextEditingController();
  final TextEditingController _pannoController = TextEditingController();
  final TextEditingController _adharnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void dispose() {
    _fullnameController.dispose();
    _mobilenoController.dispose();
    _emailController.dispose();
    _adharnoController.dispose();
    _pannoController.dispose();
    super.dispose();
  }

  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  bool get isFormValid {
    return _fullnameController.text.isNotEmpty &&
        _mobilenoController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _adharnoController.text.isNotEmpty &&
        _pannoController.text.isNotEmpty &&
        selectedGender != null;
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: myprofileLbl,
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
                      Stack(alignment: Alignment.topRight, children: [
                        Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: greayColor),
                          ),
                        ),
                        Positioned(
                            top: 3, // Adjust the top position
                            right: 125, // Adjust the right position
                            child: Image.asset(
                              DesignConfig.setPngPath(edit_icon),
                              height: 16,
                              width: 16,
                            )),
                      ]),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Full Name", _fullnameController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Mobile no.", _mobilenoController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Email", _emailController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Adhaar no.", _adharnoController),
                      const SizedBox(
                        height: 24,
                      ),
                      profileTextField("Pan no.", _pannoController),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: Manrope,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (selectedGender == null) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _genderOption("Female"),
                            SizedBox(width: 20),
                            _genderOption("male"),
                            SizedBox(width: 20),
                            _genderOption("Others"),
                          ],
                        ),
                      ] else ...[
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: selectedGender,
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: black,
                                fontFamily: Manrope,
                              )),
                        ),
                      ],
                      SizedBox(
                        height: height! / 13,
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

  Widget _genderOption(String gender) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => selectGender(gender),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromRGBO(181, 228, 202, 0.25)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greayColor),
        ),
        alignment: Alignment.center,
        child: Text(
          gender,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isSelected ? appColor : black,
              fontFamily: Manrope),
        ),
      ),
    );
  }
}
