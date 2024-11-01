import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/botton_nav.dart';
import 'package:maideaze/ui/my_booking/current_mybooking/current_booking_cancelled.dart';
import 'package:maideaze/ui/my_booking/current_mybooking/current_booking_completed.dart';
import 'package:maideaze/ui/my_booking/current_mybooking/current_booking_ongoing.dart';
import 'package:maideaze/ui/my_booking/sent_request_mybooking/sent_request_booking.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() {
    return _MyBookingState();
  }
}

class _MyBookingState extends State<MyBooking>
    with SingleTickerProviderStateMixin {
  double? height, width;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext Context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: mybookingLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      bottomNavigationBar: BottomNav(
          from: bottom_booking,
          width: width!,
          height: height!,
          context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: width! / 4),
              child: TabBar(
                controller: _tabController,
                labelColor: black,
                unselectedLabelColor: black,
                indicatorColor: appColor,
                indicatorWeight: 4.0,
                labelStyle: const TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(text: 'Current'),
                  Tab(text: 'Send Request'),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              // First tab - Current bookings
              ListView(padding: const EdgeInsets.only(top: 20), children: [
                currentBooking("Cleaning + Cooking Service",
                    "10 September, 2024 - 10 October, 2024", "Ongoing", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CurrentBookingOngoing()));
                }),
                const SizedBox(
                  height: 24,
                ),
                currentBooking("Cleaning Service",
                    "10 September, 2024 - 10 October, 2024", "Completed", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CurrentBookingCompleted()));
                }),
                const SizedBox(
                  height: 24,
                ),
                currentBooking("Pet Care Service",
                    "10 July, 2024 - 10 August, 2024", "Replaced", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CurrentBookingCancelled()));
                }),
              ]),

              // Second tab - Sent request bookings
              ListView(padding: const EdgeInsets.only(top: 20), children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SentRequestBooking()));
                  },
                  child: sentRequestBooking(
                      "pro_image_ellipse",
                      "Akshita Singh",
                      "Accepted",
                      "Yesterday",
                      "Cleaning + Cooking Service",
                      "02:00 PM - 03:00 PM (Afternoon)   ",
                      "11 September, 2024",
                      "₹10000"),
                ),
                const SizedBox(
                  height: 24,
                ),
                sentRequestBooking(
                    pro_image_ellipse,
                    "Akshita Singh",
                    "Rejected",
                    "Yesterday",
                    "Cleaning + Cooking Service",
                    "02:00 PM - 03:00 PM (Afternoon)   ",
                    "11 September, 2024",
                    "₹10000"),
                const SizedBox(
                  height: 24,
                ),
              ]),
            ])),
          ],
        ),
      ),
    );
  }

  Widget currentBooking(String service, String duration, String type,
      final VoidCallback? onTapped) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: greayColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service,
              style: const TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      color: greayLightColor,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 16,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: type == "Ongoing"
                      ? const Color.fromRGBO(255, 153, 0, 0.15)
                      : type == "Completed"
                          ? const Color.fromRGBO(181, 228, 202, 0.25)
                          : type == "Replaced"
                              ? const Color.fromRGBO(234, 124, 111, 0.25)
                              : Colors
                                  .white, // Default color if none of the conditions match

                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                type,
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: type == "Ongoing"
                        ? const Color.fromRGBO(255, 153, 0, 1)
                        : type == "Completed"
                            ? appColor
                            : type == "Replaced"
                                ? const Color.fromRGBO(210, 0, 0, 1)
                                : Colors
                                    .white, // Default color if none of the conditions match

                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sentRequestBooking(
    String image,
    String name,
    String type,
    String reqsent,
    String services,
    String duration,
    String date,
    String rupees,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: greayColor)),
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              DesignConfig.setPngPath(image),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: Manrope)),
                    const SizedBox(
                      width: 3,
                    ),
                    Image.asset(
                      DesignConfig.setPngPath(crown_golden),
                      height: 12,
                      width: 12,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: type == "Accepted"
                              ? const Color.fromRGBO(181, 228, 202, 0.25)
                              : type == "Rejected"
                                  ? const Color.fromRGBO(234, 124, 111, 0.25)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        type,
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 12,
                            color: type == "Accepted"
                                ? appColor
                                : type == "Rejected"
                                    ? const Color.fromRGBO(210, 0, 0, 1)
                                    : Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Text(reqsent,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                        fontFamily: Manrope)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      DesignConfig.setPngPath(document_text),
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      services,
                      style: const TextStyle(
                          fontFamily: Manrope,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later,
                      size: 18,
                      color: appColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      duration,
                      style: const TextStyle(
                          fontFamily: Manrope,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Image.asset(
                      DesignConfig.setPngPath(calendar),
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontFamily: Manrope,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Image.asset(
                      DesignConfig.setPngPath(rupees_icon),
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      rupees,
                      style: const TextStyle(
                          fontFamily: Manrope,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ))
          ]),
    );
  }
}
