import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/home_screen/helper%20details/helper_detailed.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class HelperDescription extends StatefulWidget {
  const HelperDescription({super.key});

  @override
  State<HelperDescription> createState() => _HelperDescriptionState();
}

class _HelperDescriptionState extends State<HelperDescription>
    with SingleTickerProviderStateMixin {
  double? height, width;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: helperdsrpLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
        rightIcon: IconButton(
          icon: const Icon(
            Icons.favorite_rounded, // Notification icon
            color: Color(0xffEE0000),
            size: 24,
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            SizedBox(
              height: 175,
              width: width,
              child: Image.asset(DesignConfig.setPngPath(pro_image_1_flex)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Akshita Singh",
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  DesignConfig.setPngPath(crown_golden),
                  height: 16,
                  width: 16,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 231, 206),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath(star),
                        height: 12,
                        width: 12,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '4.5 ',
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFF9900)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "₹5000",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  color: appColor,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: greayLightColor,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and type "
                    "industry. Lorem Ipsum has been done",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontFamily: Manrope,
                        fontSize: 11,
                        color: greayLightColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TabBar(
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
                Tab(text: 'About Me'),
                Tab(text: 'Services'),
                Tab(text: 'Reviews'),
              ],
            ),
            //Divider(color: greayLightColor),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: const EdgeInsets.only(top: 8),
                    children: [
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and "
                        "typesetting industry. Lorem Ipsum has been the industry's "
                        "standard dummy text ever since the 1500s.",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: Manrope,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      const Text("More Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: Manrope,
                              color: black)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greayColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailRow("Age", "25"),
                            DetailRow("Gender", "Female"),
                            DetailRow("Marital Status", "Single"),
                            DetailRow("Education", "Graduated"),
                            DetailRow("Work Experience", "2 Years"),
                            DetailRow("Language Proficiency", "English, Hindi"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text("Additional Details (Highlights)",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: Manrope,
                              color: black)),
                      const SizedBox(height: 10),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and "
                        "typesetting industry. Lorem Ipsum has been the industry's "
                        "standard dummy text ever since the 1500s.",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: Manrope,
                            color: black,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.only(top: 15),
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: greayColor)),
                          child: Column(children: [
                            ServiceRow("Cooking", "₹5000", "/Month"),
                            ServiceRow("Cleaning", "₹5000", "/Month"),
                            ServiceRow("Babysitting", "₹3000", "/Month"),
                            ServiceRow("Pet Care", "₹2000", "/Month"),
                          ]))
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.only(top: 8),
                    children: [
                      ReviewRow("Swati Singh", 4,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"),
                      ReviewRow("Swati Singh", 4,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"),
                      ReviewRow("Swati Singh", 4,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"),
                    ],
                  ),
                ],
              ),
            ),
            ButtonContainer(
                top: 8,
                status: false,
                borderColor: appColor,
                bottom: 5,
                text: requestLbl,
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
                          builder: (context) => const HelperDetailed()));
                })
          ],
        ),
      ),
    );
  }

  Widget DetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: Manrope,
                      color: black)),
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: Manrope,
                      color: appColor)),
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  Widget ServiceRow(String service, String price, String permonth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(service,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: Manrope,
                      color: black)),
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
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  Widget ReviewRow(String reviewer, int rating, String reviewText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: greayColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              DesignConfig.setPngPath(pro_image_ellipse),
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reviewer,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: Manrope)),
                  Row(
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath(star),
                        height: 12,
                        width: 12,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath(star),
                        height: 12,
                        width: 12,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath(star),
                        height: 12,
                        width: 12,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath(star),
                        height: 12,
                        width: 12,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath(star_outlined),
                        height: 12,
                        width: 12,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(reviewText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: greayLightColor,
                          fontFamily: Manrope)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
