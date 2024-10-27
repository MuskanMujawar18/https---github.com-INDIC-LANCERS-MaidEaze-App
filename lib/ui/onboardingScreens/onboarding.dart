import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/button.dart';
import 'package:maideaze/ui/login_screens/login_screen.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": onboarding_1, // Replace with your image path
      "title": "Explore professional services providers",
      "subtitle":
          "Effortless home services at your fingertips, your one-stop solution for all home services and more."
    },
    {
      "image": onboarding_2, // Replace with your image path
      "title": "Best helping hands for you",
      "subtitle":
          "Effortless home services at your fingertips, your one-stop solution for all home services and more."
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(181, 228, 202, 0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              DesignConfig.setPngPath(
                                  onboardingData[index]["image"]!),
                              height: 420.0,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 65,
                              top: 65,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: appColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (dotIndex) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: _currentIndex == dotIndex
                                    ? appColor
                                    : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16.0),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(children: [
                              Text(
                                onboardingData[index]["title"]!,
                                style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Manrope),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                onboardingData[index]["subtitle"]!,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Manrope,
                                    color: greayLightColor),
                                textAlign: TextAlign.center,
                              ),
                            ])),
                        // Button
                        const SizedBox(
                          height: 20,
                        ),
                        _currentIndex == onboardingData.length - 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: ButtonContainer(
                                    top: 8,
                                    status: false,
                                    borderColor: appColor,
                                    bottom: 5,
                                    text: getstartedLbl,
                                    fontSize: 16,
                                    color: appColor,
                                    textColor: white,
                                    end: 60,
                                    circularRadius: 8,
                                    start: 60,
                                    height: height,
                                    width: width,
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    }))
                            : GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: appColor,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        const SizedBox(height: 40.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
