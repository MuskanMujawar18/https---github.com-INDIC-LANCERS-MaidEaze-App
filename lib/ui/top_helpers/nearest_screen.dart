import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class NearestScreen extends StatefulWidget {
  const NearestScreen({super.key});

  @override
  State<NearestScreen> createState() {
    return _NearestScreenState();
  }
}

class _NearestScreenState extends State<NearestScreen> {
  double? height, width;
  String selectedTopic = 'Distance';
  String selectedType = 'Cooking';
  Map<String, String> selectedFilters = {};
  Map<String, String> selectedCategory = {};
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

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: "Top Helpers",
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              DesignConfig.setPngPath("setting_icon"),
                              height: 12,
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () => openfiltersheet(context),
                              child: const Text(
                                " Filter ",
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
                    const SizedBox(
                      width: 20,
                    ),
                    Card(
                      child: Container(
                        color: Color.fromRGBO(181, 228, 202, 0.25),
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 5, left: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {},
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
                  height: 120,
                ),
                Center(
                    child: Image.asset(
                  DesignConfig.setPngPath("nearest_not_found"),
                  height: 250,
                  width: 250,
                )),
                Text(
                  "No top helpers nearest you.",
                  style: TextStyle(
                      fontFamily: Manrope,
                      fontSize: 12,
                      color: greayLightColor,
                      fontWeight: FontWeight.w500),
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
            onPressed: () async {},
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
            onPressed: () async {},
          )
        ],
      ),
    );
  }
}
