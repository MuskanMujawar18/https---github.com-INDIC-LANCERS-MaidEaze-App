import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/global/calendar.dart';
import 'package:maideaze/ui/global/common_screen.dart';
import 'package:maideaze/ui/home_screen/home_page.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';
import 'package:intl/intl.dart';

class HelperDetailed extends StatefulWidget {
  const HelperDetailed({super.key});

  @override
  State<HelperDetailed> createState() => _HelperDetailedState();
}

class _HelperDetailedState extends State<HelperDetailed> {
  double? height, width;
  bool _isCookingSelected = false;
  bool _isCleaningSelected = false;
  bool _isBabysittingSelected = false;
  int _numberOfPersons = 1;
  int _numberOfBHK = 1;
  String selectedTime = "Morning";
  Map<String, String> selectedTimeSlots = {};

  Map<String, List<String>> timeOptions = {
    "Morning": [
      "06:00 AM - 08:00 AM",
      "08:00 AM - 10:00 AM",
      "10:00 AM - 12:00 PM"
    ],
    "Afternoon": ["12:00 PM - 02:00 PM", "02:00 PM - 04:00 PM"],
    "Evening": ["04:00 PM - 06:00 PM", "06:00 PM - 08:00 PM"]
  };
  DateTime? _selectedDate;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: detailedLbl,
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Service Category",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  const Text(
                    "You can select more than 1 category",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 10,
                        color: greayLightColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greayColor)),
                      child: Column(children: [
                        _buildCustomCheckbox(
                          "Cooking Service",
                          "₹5000",
                          "/Month",
                          _isCookingSelected,
                          (bool? value) {
                            setState(() {
                              _isCookingSelected = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildCustomCheckbox(
                          "Cleaning Service",
                          "₹5000",
                          "/Month",
                          _isCleaningSelected,
                          (bool? value) {
                            setState(() {
                              _isCleaningSelected = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildCustomCheckbox(
                          "Babysitting Service",
                          "₹5000",
                          "/Month",
                          _isBabysittingSelected,
                          (bool? value) {
                            setState(() {
                              _isBabysittingSelected = value ?? false;
                            });
                          },
                        ),
                      ])),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: _isCookingSelected,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: greayColor)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: const Text(
                                "Number of Persons",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              margin:
                                  EdgeInsets.only(right: 0, bottom: 5, top: 5),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(181, 228, 202, 0.25),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: appColor, width: 0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_numberOfPersons > 1) {
                                          _numberOfPersons--;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '$_numberOfPersons',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: Manrope,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _numberOfPersons++;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: _isCleaningSelected,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: greayColor)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: const Text(
                              "Number of BHK",
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Spacer(),
                          Container(
                            //width: width,
                            height: 30,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            margin:
                                EdgeInsets.only(right: 0, bottom: 5, top: 5),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(181, 228, 202, 0.25),
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: appColor, width: 0.5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_numberOfBHK > 1) {
                                        _numberOfBHK--;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '$_numberOfBHK',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: Manrope,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _numberOfBHK++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Available Time slot",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 137,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: greayColor),
                              borderRadius: BorderRadius.circular(10),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: timeOptions.keys.map((topic) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTime = topic;
                                  });
                                },
                                child: Container(
                                  width: width,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 5, 10),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: selectedTime == topic
                                        ? Color.fromRGBO(181, 228, 202, 0.25)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    topic,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Manrope,
                                      fontWeight: FontWeight.w500,
                                      color: selectedTime == topic
                                          ? appColor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 175,
                        height: 137,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: greayColor),
                              borderRadius: BorderRadius.circular(8),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: timeOptions[selectedTime]!.map((option) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedTimeSlots[selectedTime] ==
                                        option) {
                                      selectedTimeSlots.remove(selectedTime);
                                    } else {
                                      selectedTimeSlots[selectedTime] = option;
                                    }
                                  });
                                },
                                child: Container(
                                  width: width,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: selectedTimeSlots[selectedTime] ==
                                            option
                                        ? Color.fromRGBO(181, 228, 202, 0.25)
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Manrope,
                                      fontWeight: FontWeight.w500,
                                      color: selectedTimeSlots[selectedTime] ==
                                              option
                                          ? appColor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Joining Date",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: _selectedDate != null
                            ? DateFormat('d MMMM, yyyy').format(_selectedDate!)
                            : "Select",
                        hintStyle: _selectedDate != null
                            ? TextStyle(
                                fontFamily: Manrope,
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.w400)
                            : const TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 12,
                                color: Color(0xffC4C4C4),
                                fontWeight: FontWeight.w400,
                              ),
                        suffixIcon: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Image.asset(
                              DesignConfig.setPngPath(calendar),
                              height: 12,
                              width: 12,
                            ),
                          ),
                          onTap: () async {
                            _showCalendarPopup(context);
                          },
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: greyLight))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Add Description",
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  TextField(
                    maxLines: null,
                    minLines: 3,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 70.0, left: 25),
                          child: Image.asset(
                            DesignConfig.setPngPath(drag_icon),
                            height: 12,
                            width: 12,
                          ),
                        ),
                        hintText: "Write detailed specification (if any)",
                        hintStyle: TextStyle(
                            fontFamily: Manrope,
                            color: Color(0xffC4C4C4),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: greyLight))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffF3F3F3)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonContainer(
                      top: 8,
                      status: false,
                      borderColor: appColor,
                      bottom: 5,
                      text: sendrequestLbl,
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
                                builder: (context) => CommonScreen(
                                    imagePath: 'request_send_image',
                                    title: 'Request Sent!',
                                    titleFontWeight: FontWeight.w600,
                                    titlefontSize: 32,
                                    titlefontColor: black,
                                    buttonText: backtohomescreenLbl,
                                    onButtonPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    })));
                      })
                ])),
      ),
    );
  }

  Widget _buildCustomCheckbox(String title, String price, String permonth,
      bool isSelected, Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                onChanged(!isSelected);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: appColor,
                    width: 2,
                  ),
                  color: isSelected ? appColor : Colors.transparent,
                ),
                width: 16,
                height: 16,
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 9),
            // Service title
            Text(
              title,
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: Manrope,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // Service price
        Row(
          children: [
            Text(price,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: Manrope,
                    color: black)),
            Text(permonth,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    fontFamily: Manrope,
                    color: black))
          ],
        ),
      ],
    );
  }

  void _showCalendarPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 338,
          width: width,
          child: CalendarPopup(
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        );
      },
    );
  }
}
