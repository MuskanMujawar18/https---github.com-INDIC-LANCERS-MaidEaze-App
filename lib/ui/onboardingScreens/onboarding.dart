import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/button.dart';
import 'package:maideazw/ui/login_screens/login_screen.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/imagesDefine.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  double? height, width;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> onboardingData = [
    {
      "image": onboarding_1,
      "title": onboardingtitle1,
      "subtitle": onboardingsubtitle1
    },
    {
      "image": onboarding_2,
      "title": onboardingtitle2,
      "subtitle": onboardingsubtitle2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                DesignConfig.setPngPath(
                                  onboardingData[index]["image"]!,
                                ),
                                height: 490.0,
                                width: width,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 40.0,
                                left:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(onboardingData.length,
                                      (dotIndex) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8.0,
                                      width: 8.0,
                                      decoration: BoxDecoration(
                                        color: _currentIndex == dotIndex
                                            ? appColor
                                            : Colors.green[100],
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 17.0),
                            child: Column(
                              //  mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  onboardingData[index]["title"]!,
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: Manrope),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    onboardingData[index]["subtitle"]!,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: greayLightColor,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                _currentIndex == onboardingData.length - 1
                                    ? ButtonContainer(
                                        top: 8,
                                        status: false,
                                        borderColor: appColor,
                                        bottom: 5,
                                        text: getstartedLbl,
                                        fontSize: 16,
                                        color: appColor,
                                        textColor: white,
                                        end: 80,
                                        circularRadius: 8,
                                        start: 80,
                                        height: height,
                                        width: width,
                                        onPressed: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen()));
                                        })
                                    : GestureDetector(
                                        onTap: () {
                                          _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeIn);
                                        },
                                        child: Container(
                                          height: 48,
                                          width: 48,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: appColor),
                                          child: const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: white,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                //const SizedBox(height: 10.0), // Space between text and button
                // Button or next page control
                // _currentIndex == onboardingData.length - 1
                //     ? ButtonContainer(
                //         top: 8,
                //         status: false,
                //         borderColor: appColor,
                //         bottom: 5,
                //         text: getstartedLbl,
                //         fontSize: 16,
                //         color: appColor,
                //         textColor: white,
                //         end: 100,
                //         circularRadius: 8,
                //         start: 100,
                //         height: height,
                //         width: width,
                //         onPressed: () async {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const LoginScreen()));
                //         })
                //     : GestureDetector(
                //         onTap: () {
                //           _pageController.nextPage(
                //               duration: const Duration(milliseconds: 300),
                //               curve: Curves.easeIn);
                //         },
                //         child: Container(
                //           height: 48,
                //           width: 48,
                //           decoration: const BoxDecoration(
                //               shape: BoxShape.circle, color: appColor),
                //           child: const Icon(
                //             Icons.arrow_forward_ios_sharp,
                //             color: white,
                //           ),
                //         ),
                //       ),
              ],
            ),

            // Small green dot on the right side of image
            Positioned(
              right: 75,
              top: 120,
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
      ),
    );
  }
}
