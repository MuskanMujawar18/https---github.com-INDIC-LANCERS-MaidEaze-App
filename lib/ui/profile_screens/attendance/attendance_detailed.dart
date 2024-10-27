import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';

import 'package:maideaze/ui/global/separate_card.dart';
import 'package:maideaze/ui/profile_screens/attendance/leave_details.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';
import 'package:intl/intl.dart';

class AttendanceDetailed extends StatefulWidget {
  const AttendanceDetailed({super.key});

  @override
  State<AttendanceDetailed> createState() {
    return _AttendanceDetailedState();
  }
}

class _AttendanceDetailedState extends State<AttendanceDetailed> {
  double? height, width;
  bool isApproved = false;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: attendancedetailedLbl,
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
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceProvider(
                          "Akshita Singh",
                          "2.5 Km",
                          4.5,
                          "Lorem Ipsum is simply dummy text of the printing",
                          "pro_image_1",
                          "gold"),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(181, 228, 202, 0.05),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Cleaning Service",
                                  style: TextStyle(
                                      fontFamily: Manrope,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  "Ongoing",
                                  style: TextStyle(
                                      fontFamily: Manrope,
                                      fontSize: 14,
                                      color: appColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "10 September, 2024 - 10 October, 2024",
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  color: greayLightColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      buildCalendarPopup(context, (selectedDate) {}),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width! / 50),
                          child: Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: appColor),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                "Present",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    color: greayLightColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: width! / 5.5,
                              ),
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: appColor, width: 1.0),
                                    shape: BoxShape.circle,
                                    color: white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                "Absent",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    color: greayLightColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: width! / 5.5,
                              ),
                              Container(
                                height: 12,
                                width: 12,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffB5E4CA)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                "Leaves",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    color: greayLightColor,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greayColor)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LeaveDetailed()));
                          },
                          child: const Row(
                            children: [
                              Text(
                                "Leave Details",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 12,
                                    color: black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      if (!isApproved)
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: greayColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Approve attendance for today (11 September, 2024)",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 12,
                                    color: black,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    color: greayLightColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  ButtonContainer(
                                      top: 0,
                                      status: false,
                                      borderColor: appColor,
                                      bottom: 0,
                                      text: approveLbl,
                                      fontSize: 16,
                                      color: appColor,
                                      textColor: white,
                                      end: 0,
                                      circularRadius: 8,
                                      start: 0,
                                      height: height,
                                      width: width! / 2.5,
                                      onPressed: () async {
                                        setState(() {
                                          isApproved = true;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        )
                    ]))));
  }

  Widget buildCalendarPopup(
      BuildContext context, Function(DateTime) onDateSelected) {
    DateTime selectedDate = DateTime.now();
    DateTime focusedDate = DateTime.now();

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          // width: MediaQuery.of(context).size.width * 0.9,
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildCalendarHeader(focusedDate, setState),
                buildCalendarDays(focusedDate, selectedDate, (date) {
                  selectedDate = date;
                  onDateSelected(selectedDate);
                  Navigator.pop(context);
                }, setState),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCalendarHeader(
      DateTime focusedDate, void Function(void Function()) setState) {
    final monthFormat = DateFormat("MMMM ’yy");
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 20, left: 15.0, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            monthFormat.format(focusedDate),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
            ),
          ),
          const Spacer(),
          GestureDetector(
            child: const Icon(Icons.chevron_left),
            onTap: () {
              setState(() {
                focusedDate = DateTime(
                    focusedDate.year, focusedDate.month - 1, focusedDate.day);
              });
            },
          ),
          const SizedBox(width: 10),
          GestureDetector(
            child: const Icon(Icons.chevron_right),
            onTap: () {
              setState(() {
                focusedDate = DateTime(
                    focusedDate.year, focusedDate.month + 1, focusedDate.day);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildCalendarDays(
      DateTime focusedDate,
      DateTime selectedDate,
      Function(DateTime) onDaySelected,
      void Function(void Function()) setState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Days of the week
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((day) {
                return Text(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color: appColor,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          // Days of the month
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount:
                DateUtils.getDaysInMonth(focusedDate.year, focusedDate.month),
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = selectedDate.year == focusedDate.year &&
                  selectedDate.month == focusedDate.month &&
                  selectedDate.day == day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate =
                        DateTime(focusedDate.year, focusedDate.month, day);
                  });
                  onDaySelected(selectedDate);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          color: appColor,
                        )
                      : null,
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
