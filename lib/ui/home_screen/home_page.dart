import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/textfield_border.dart';
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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, top: 40, right: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  size: 30,
                  color: appColor,
                ),
                const Column(
                  children: [
                    Row(children: [
                      Text(
                        "Home ",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: Manrope,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: black,
                        size: 24,
                      ),
                    ]),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "X-25, Building name , Society",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: Manrope,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Image.asset(DesignConfig.setPngPath("language")),
                  iconSize: 20,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(DesignConfig.setPngPath("notification")),
                  iconSize: 20,
                  onPressed: () {},
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
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index, context)),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomSearchField(
              hintText: "Search for ‘Cooking services’",
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Categories",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: Manrope,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  mainAxisSpacing: 15.0, // Space between rows
                  crossAxisSpacing: 15.0, // Space between columns
                  childAspectRatio: 0.7, // Aspect ratio of each grid item
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                          child: Image.asset(
                            DesignConfig.setPngPath(
                              services[index]["image"]!,
                            ),
                            fit: BoxFit.cover,
                            height: 64,
                            width: 73,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
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
}
