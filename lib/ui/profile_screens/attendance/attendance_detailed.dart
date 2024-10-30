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
  DateTime selectedMonth = DateTime(2024, 9, 1);

  final Map<int, String> dayStatuses = {
    11: "Present",
    12: "Absent",
    13: "Leaves",
    15: "Present",
    14: "Present"
  };

  Widget build(BuildContext context) {
    double calendarWidth = MediaQuery.of(context).size.width;
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
                      Container(
                        width: calendarWidth,
                        height: 340,
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: greayColor),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            _buildMonthHeader(),
                            SizedBox(height: 8),
                            _buildDaysOfWeek(),
                            SizedBox(height: 8),
                            _buildCalendarDays(),
                          ],
                        ),
                      ),
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

  Widget _buildMonthHeader() {
    String monthYear = DateFormat("MMMM ''yy").format(selectedMonth);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          monthYear,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, fontFamily: Manrope),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            setState(() {
              selectedMonth =
                  DateTime(selectedMonth.year, selectedMonth.month - 1, 1);
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: () {
            setState(() {
              selectedMonth =
                  DateTime(selectedMonth.year, selectedMonth.month + 1, 1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    List<String> days = ["M", "T", "W", "T", "F", "S", "S"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((day) => Text(
                day,
                style: TextStyle(
                    color: appColor, fontWeight: FontWeight.w500, fontSize: 12),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarDays() {
    int daysInMonth =
        DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;
    int firstDayOfWeek =
        DateTime(selectedMonth.year, selectedMonth.month, 1).weekday % 7;

    List<Widget> dayWidgets = [];
    for (int i = 0; i < firstDayOfWeek; i++) {
      dayWidgets.add(Container()); // Empty space for days before the first day
    }

    for (int day = 1; day <= daysInMonth; day++) {
      // Check if the day has a predefined status; if not, it's null
      String? status = dayStatuses[day];
      dayWidgets.add(_buildDayWidget(day, status));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      children: dayWidgets,
    );
  }

  Widget _buildDayWidget(int day, String? status) {
    Map<String, Color> statusColors = {
      "Present": appColor,
      "Absent": Colors.transparent,
      "Leaves": Color(0xffB5E4CA),
    };

    return Container(
      margin: EdgeInsets.all(4),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (status == "Present")
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: statusColors["Present"]!,
                  shape: BoxShape.circle,
                ),
              ),

            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: status == "Leaves"
                    ? statusColors["Leaves"]
                    : (status == "Present"
                        ? statusColors["Present"]
                        : Colors.transparent),
                shape: BoxShape.circle,
                border: status == "Absent"
                    ? Border.all(color: statusColors["Present"]!, width: 2)
                    : null,
              ),
            ),
            // Day number text
            Text(
              day.toString(),
              style: TextStyle(
                color: status == "Present"
                    ? Colors.white
                    : status == "Absent" || status == "Leaves"
                        ? appColor
                        : Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Manrope',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
