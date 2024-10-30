import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/common_screen.dart';
import 'package:maideaze/ui/profile_screens/support/query_chat_pro.dart';
import 'package:maideaze/ui/profile_screens/support/query_chat_res.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() {
    return _QueryScreenState();
  }
}

class _QueryScreenState extends State<QueryScreen>
    with SingleTickerProviderStateMixin {
  double? height, width;

  late TabController _tabController;

  // Sample lists of queries for each tab (can be replaced with actual data)
  final List<Map<String, dynamic>> openQueries = [
    {
      "title": "Title of Query",
      "type": "Processing",
      "typeColor": const Color(0xffFF9800),
      "typeContainerColor": const Color.fromRGBO(255, 152, 0, 0.2),
      "ticketId": "Ticket Id",
      "date": "12/09/2024"
    }
  ];
  final List<Map<String, dynamic>> closedQueries = [
    {
      "title": "Title of Query",
      "type": "Rasolved",
      "typeColor": appColor,
      "typeContainerColor": const Color.fromRGBO(181, 228, 202, 0.25),
      "ticketId": "Ticket Id",
      "date": "12/09/2024"
    }
  ];

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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: yourqueryLbl,
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width! / 4.5),
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
                    Tab(text: 'Open Queries'),
                    Tab(text: 'Closed Queries'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    openQueries.isEmpty
                        ? const CommonScreen(
                            imagePath: queries,
                            title: "No Closed Tickets",
                            titlefontSize: 12,
                            titleFontWeight: FontWeight.w400,
                            titlefontColor: greayLightColor)
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QueryChatPro()));
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 24),
                              itemCount: openQueries.length,
                              itemBuilder: (context, index) {
                                final query = openQueries[index];
                                return queryContainer(
                                  query["title"] ?? "Title of Query",
                                  query["status"] ?? "Processing",
                                  const Color(0xffFF9800) as Color?,
                                  const Color.fromRGBO(255, 152, 0, 0.2)
                                      as Color?,
                                  query["ticketId"] ?? "Ticket Id",
                                  query["date"] ?? "12/09/2024",
                                );
                              },
                            ),
                          ),
                    closedQueries.isEmpty
                        ? const CommonScreen(
                            imagePath: queries,
                            title: "No Closed Tickets",
                            titlefontSize: 12,
                            titleFontWeight: FontWeight.w400,
                            titlefontColor: greayLightColor)
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QueryChatRes()));
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 24),
                              itemCount: closedQueries.length,
                              itemBuilder: (context, index) {
                                final query = closedQueries[index];
                                return queryContainer(
                                  query["title"] ?? "Title of Query",
                                  query["status"] ?? "Resolved",
                                  appColor as Color?,
                                  const Color.fromRGBO(181, 228, 202, 0.25)
                                      as Color?,
                                  query["ticketId"] ?? "Ticket Id",
                                  query["date"] ?? "12/09/2024",
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget queryContainer(String title, String type, Color? typeColor,
      Color? typeContainerColor, String ticketId, String date) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: greayColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: typeContainerColor),
                child: Text(
                  type,
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      color: typeColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ticketId,
            style: const TextStyle(
                fontFamily: Manrope,
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            date,
            style: const TextStyle(
                fontFamily: Manrope,
                fontSize: 10,
                color: greayLightColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
