import 'dart:core';
import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/global/botton_nav.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/global/common_screen.dart';
import 'package:maideaze/ui/top_helpers/nearest_screen.dart';

import '../global/helper_card.dart';
import '../styles/color.dart';
import '../styles/design.dart';
import '../utils/constansts.dart';
import '../utils/imagesDefine.dart';
import '../utils/labelKeys.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() {
    return _FavScreenState();
  }
}

class _FavScreenState extends State<FavScreen> {
  double? height, width;
  String selectedTopic = 'Distance';
  String selectedType = 'Cooking';
  Map<String, String> selectedFilters = {};
  Map<String, String> selectedCategory = {};
  bool isFilterApplied = false;

  final Map<String, List<String>> filterOptions = {
    'Distance': [
      '0 Km - 5 Km',
      '5 Km - 10 Km',
      '10 Km - 15 Km',
      '15 Km - 20 Km',
    ],
    'Rating': [
      '4.0 - Above',
      '3.0 - 4.0',
      '3.0 - Below',
    ],
    'Price': [
      '₹5000 - ₹10000',
      '₹3000 - ₹5000',
      '₹1000 - ₹3000',
    ],
    'Experience': [
      '5+ Years',
      '4 Years - 5 Years',
      '3 Years - 4 Years',
      '2 Years - 3 Years',
      '1 Year - 2 Years',
    ],
    'Badge': ['Golden', 'Silver', 'Bronze'],
    'Gender': ['Female', 'Male', 'No Preference'],
  };

  final Map<String, List<String>> categoryOptions = {
    'Cooking': [
      'Vegetarian',
      'Non-Vegetarian',
      'Both Veg & Non-veg',
      'Jain',
    ],
    'Cleaning': [
      'Sweeping & Mopping',
      'Bathroom Cleaning',
      'Pet Area Cleaning',
      'Vessel Cleaning'
    ],
    'Babysitting': [
      'Infant Care',
      'Toddler Care',
      'Japa Maid',
      'General Childcare'
    ],
    'Pet Care': [
      'Dog',
      'Cat',
    ],
    'Patient Care': [
      'Daily Care',
      'Health Monitoring',
      'Companionship',
      'Mobility Assistance'
    ],
    'Laundry': ['Washing Clothes', 'Ironing', 'Folding'],
    'Vessel Cleaning': ['No Sub-category'],
    'Full-Time': ['No Sub-category']
  };

  @override
  Widget build(BuildContext context) {
    void openfiltersheet(context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return filterbottomsheet(context, setState);
            },
          );
        },
      );
    }

    void opencategorysheet(context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return categorybottomsheet(context, setState);
            },
          );
        },
      );
    }

    final List<Map<String, dynamic>> topHelpers = [
      {
        "name": "Akshita Singh",
        "distance": "2.5 Km",
        "rating": 4.5,
        "price": "₹5000",
        "isFavorite": true,
        "imageUrl": pro_image_1,
        "rank": "gold",
      },
      {
        "name": "Gaurav Singh",
        "distance": "2.5 Km",
        "rating": 3.5,
        "price": "₹5000",
        "isFavorite": true,
        "imageUrl": pro_image_2,
        "rank": "gold",
      },
      {
        "name": "Priya Gupta",
        "distance": "5.0 Km",
        "rating": 4.0,
        "price": "₹3000",
        "isFavorite": true,
        "imageUrl": pro_image_3,
        "rank": "silver",
      },
      {
        "name": "Pooja Roy",
        "distance": "2.5 Km",
        "rating": 3.5,
        "price": "₹2000",
        "isFavorite": true,
        "imageUrl": pro_image_1,
        "rank": "gold",
      },
    ];

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNav(
            from: bottom_fav, width: width!, height: height!, context: context),
        backgroundColor: white,
        appBar: CustomAppBar(
          title: favoritesLbl,
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
          rightIcon: IconButton(
            icon: Image.asset(
              DesignConfig.setPngPath(notification),
              height: 20,
              width: 20,
            ),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Card(
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Image.asset(
                              DesignConfig.setPngPath(setting_icon),
                              height: 12,
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (isFilterApplied) {
                                  // Clear filters if cross icon is pressed
                                  setState(() {
                                    selectedFilters.clear();
                                    isFilterApplied = false;
                                  });
                                } else {
                                  openfiltersheet(context);
                                }
                              },
                              child: const Text(
                                " Filter ",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            isFilterApplied
                                ? const Icon(
                                    Icons.close,
                                    size: 12,
                                  )
                                : const Icon(
                                    Icons.arrow_drop_down,
                                    size: 12,
                                  )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Card(
                      child: SizedBox(
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 5, left: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NearestScreen()));
                            },
                            child: const Text(
                              " Nearest ",
                              style: TextStyle(
                                  fontFamily: Manrope,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Card(
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              onTap: () => opencategorysheet(context),
                              child: const Text(
                                " Category ",
                                style: TextStyle(
                                    fontFamily: Manrope,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 12,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                topHelpers.isEmpty
                    ? CommonScreen(
                        imagePath: "nearest_not_found",
                        title: "No favorites",
                        titlefontSize: 12,
                        titleFontWeight: FontWeight.w500,
                        titlefontColor: greayLightColor)
                    : ListView.builder(
                        itemCount: topHelpers.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var helper = topHelpers[index];
                          return Container(
                            margin: EdgeInsets.only(top: index == 0 ? 0 : 24),
                            child: TopHelperCard(
                              name: helper['name'],
                              distance: helper['distance'],
                              rating: helper['rating'],
                              price: helper['price'],
                              isFavorite: helper['isFavorite'],
                              imageUrl: helper['imageUrl'],
                              rank: helper['rank'],
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ));
  }

  Widget filterbottomsheet(BuildContext context, StateSetter setState) {
    return Container(
      //color: white,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Sort by',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: Manrope),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 280,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: greayColor),
                      borderRadius: BorderRadius.circular(10),
                      color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: filterOptions.keys.map((topic) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopic = topic;
                          });
                        },
                        child: Container(
                          width: width,
                          padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedTopic == topic
                                ? Color.fromRGBO(181, 228, 202, 0.25)
                                : Colors.white,
                          ),
                          child: Text(
                            topic,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Manrope,
                              fontWeight: FontWeight.w500,
                              color: selectedTopic == topic
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
                width: 182,
                height: 280,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: greayColor),
                      borderRadius: BorderRadius.circular(8),
                      color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: filterOptions[selectedTopic]!.map((option) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedFilters[selectedTopic] == option) {
                              selectedFilters.remove(selectedTopic);
                            } else {
                              selectedFilters[selectedTopic] = option;
                            }
                          });
                        },
                        child: Container(
                          width: width,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedFilters[selectedTopic] == option
                                ? Color.fromRGBO(181, 228, 202, 0.25)
                                : Colors.white,
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Manrope,
                              fontWeight: FontWeight.w500,
                              color: selectedFilters[selectedTopic] == option
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
          const SizedBox(height: 15),
          ButtonContainer(
            top: 8,
            status: false,
            borderColor: appColor,
            bottom: 5,
            text: applyLbl,
            fontSize: 16,
            color: appColor,
            textColor: white,
            end: 0,
            circularRadius: 8,
            start: 0,
            height: height,
            width: width,
            onPressed: () async {
              setState(() {
                isFilterApplied = true;
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget categorybottomsheet(BuildContext context, StateSetter setState) {
    ScrollController _scrollController = ScrollController();
    return Container(
      //color: white,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      //height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Select Category',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: Manrope),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 280,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: greayColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: RawScrollbar(
                    controller: _scrollController,
                    thumbColor: appColor,
                    minThumbLength: 5,
                    thickness: 2,
                    trackVisibility: true,
                    radius: const Radius.circular(5),
                    child: ListView(
                      controller: _scrollController,
                      children: categoryOptions.keys.map((topic) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = topic;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: selectedType == topic
                                  ? Color.fromRGBO(181, 228, 202, 0.25)
                                  : Colors.white,
                            ),
                            child: Text(
                              topic,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                color: selectedType == topic
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
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 182,
                height: 280,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: greayColor),
                      borderRadius: BorderRadius.circular(8),
                      color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categoryOptions[selectedType]!.map((option) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedCategory[selectedType] == option) {
                              selectedCategory.remove(selectedType);
                            } else {
                              selectedCategory[selectedType] = option;
                            }
                          });
                        },
                        child: Container(
                          width: width,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedCategory[selectedType] == option
                                ? Color.fromRGBO(181, 228, 202, 0.25)
                                : Colors.white,
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Manrope,
                              fontWeight: FontWeight.w500,
                              color: selectedCategory[selectedType] == option
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
          const SizedBox(height: 15),
          ButtonContainer(
            top: 8,
            status: false,
            borderColor: appColor,
            bottom: 5,
            text: applyLbl,
            fontSize: 16,
            color: appColor,
            textColor: white,
            end: 0,
            circularRadius: 8,
            start: 0,
            height: height,
            width: width,
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
