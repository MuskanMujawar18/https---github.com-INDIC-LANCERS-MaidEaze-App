import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/botton_nav.dart';
import 'package:maideazw/ui/global/helper_card.dart';
import 'package:maideazw/ui/global/search_field.dart';
import 'package:maideazw/ui/notification/notification.dart';
import 'package:maideazw/ui/search_screen/searchScreen.dart';
import 'package:maideazw/ui/select_location/select_location.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/imagesDefine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? height, width;
  PageController _pageController = PageController(); // Controls the page scroll
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {"image": cooking, "name": 'Cooking'},
      {"image": cleaning, "name": 'Cleaning'},
      {"image": babysitting, "name": 'Babysitting'},
      {"image": pet_care, "name": 'Pet Care'},
      {"image": patient_care, "name": 'Patient        Care'},
      {"image": vessel_cleaning, "name": 'Vessel Cleaning'},
      {"image": laundry_service, "name": 'Laundry Service'},
      {"image": day_night_service, "name": '24 Hours Service'},
    ];

    final List<Map<String, dynamic>> topHelpers = [
      {
        "name": "Akshita Singh",
        "distance": "2.5 Km",
        "rating": 4.5,
        "price": "₹5000",
        "isFavorite": false,
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
        "isFavorite": false,
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

    final List<Map<String, dynamic>> favHelpers = [
      {
        "name": "Priya Gupta",
        "distance": "2.5 Km",
        "rating": 3.5,
        "price": "₹2000",
        "isFavorite": true,
        "imageUrl": pro_image_3,
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
    ];

    void openAddLocation(context) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => addressSelectionSheet(context));
    }

    void openLanguage(context) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (ctx) => locationSelection(context));
    }

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNav(
            from: bottom_home,
            width: width!,
            height: height!,
            context: context),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 40, right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 26,
                          color: appColor,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Home ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Manrope,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () => openAddLocation(context),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 16,
                                    ))
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "X-25, Building name, Society",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: Manrope,
                                color: black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(), // Push the language and notification icons to the right

                    GestureDetector(
                      onTap: () => openLanguage(context),
                      child: Image.asset(
                        DesignConfig.setPngPath("language"),
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()));
                      },
                      child: Image.asset(
                        DesignConfig.setPngPath("notification"),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  width: width,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: <Widget>[
                      Image.asset(
                        DesignConfig.setPngPath("banner"),
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath("banner"),
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        DesignConfig.setPngPath("banner"),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(3, (index) => buildDot(index, context)),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSearchField(
                  hintText: "Search for ‘Cooking services’",
                  onPressed: (ctx) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Manrope,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0), // Padding around the GridView
                  child: GridView.builder(
                    itemCount: services.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 14.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                              child: Image.asset(
                                DesignConfig.setPngPath(
                                    services[index]["image"]!),
                                fit: BoxFit.cover,
                                height: 64, // Height for the image
                                width: 73, // Width for the image
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 6.0), // Space between image and text
                          Text(
                            services[index]["name"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontFamily: Manrope,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Top Helpers",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: Manrope,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: Manrope,
                        color: appColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: topHelpers.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var helper = topHelpers[index];
                    return TopHelperCard(
                      name: helper['name'],
                      distance: helper['distance'],
                      rating: helper['rating'],
                      price: helper['price'],
                      isFavorite: helper['isFavorite'],
                      imageUrl: helper['imageUrl'],
                      rank: helper['rank'],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: Manrope,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: Manrope,
                        color: appColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: favHelpers.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var helper = favHelpers[index];
                    return TopHelperCard(
                      name: helper['name'],
                      distance: helper['distance'],
                      rating: helper['rating'],
                      price: helper['price'],
                      isFavorite: helper['isFavorite'],
                      imageUrl: helper['imageUrl'],
                      rank: helper['rank'],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: _currentPage == index ? 9 : 7,
      width: _currentPage == index ? 9 : 7,
      decoration: BoxDecoration(
        color: _currentPage == index ? black : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget locationSelection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Select Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: Manrope),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: greayColor)),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7EEE6), // Highlight color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Manrope,
                          color: appColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Other languages
                  _buildLanguageItem("हिन्दी"),
                  _buildLanguageItem("मराठी"),
                  _buildLanguageItem("తెలుగు"),
                  _buildLanguageItem("தமிழ்"),
                  _buildLanguageItem("മലയാളം"),
                  _buildLanguageItem("ಕನ್ನಡ"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressSelectionSheet(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 288,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            'Select Address',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, fontFamily: Manrope),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: greayColor, width: 0.5),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD7EEE6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath("home_icon"),
                        height: 12,
                        width: 12,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Manrope',
                            ),
                          ),
                          Text(
                            'XYZ, Building name, City, State, etc.',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: greayLightColor,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        DesignConfig.setPngPath("building_icon"),
                        height: 12,
                        width: 12,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Office',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Manrope',
                            ),
                          ),
                          Text(
                            'XYZ, Building name, City, State, etc.',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: greayLightColor,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomSearchField(
              hintText: "Search location manually",
              onPressed: (ctx) {
                Navigator.push(
                    ctx,
                    MaterialPageRoute(
                        builder: (ctx) => const SelectLocation()));
              }),
        ]));
  }

  Widget _buildLanguageItem(String language) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        language,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: Manrope,
          fontWeight: FontWeight.w500,
          color: black, // Color for non-selected items
        ),
      ),
    );
  }
}
