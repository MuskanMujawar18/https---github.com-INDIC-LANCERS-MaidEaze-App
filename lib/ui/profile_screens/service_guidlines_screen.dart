import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class ServiceGuidlinesScreen extends StatelessWidget {
  const ServiceGuidlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: serviceguidlineLbl,
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                DesignConfig.setPngPath(service_guidlines_image),
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Felis nunc consequat massa egestas feugiat quis tristique. Fringilla venenatis sagittis in pellentesque lorem fermentum tincidunt velit tempor. Ac laoreet non accumsan tincidunt eleifend placerat adipiscing vulputate. Fames urna elementum molestie vel nam sit etiam congue pellentesque interdum turpis non magna molestie.",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 14,
                    color: black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Felis nunc consequat massa egestas feugiat quis tristique. Fringilla venenatis sagittis in pellentesque lorem fermentum tincidunt velit tempor. Ac laoreet non accumsan tincidunt eleifend placerat adipiscing vulputate. Fames urna elementum molestie vel nam sit etiam congue pellentesque interdum turpis non magna molestie.",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 14,
                    color: black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Felis nunc consequat massa egestas feugiat quis tristique. Fringilla venenatis sagittis in pellentesque lorem fermentum tincidunt velit tempor. Ac laoreet non accumsan tincidunt eleifend placerat adipiscing vulputate. Fames urna elementum molestie vel nam sit etiam congue pellentesque interdum turpis non magna molestie.",
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 14,
                    color: black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
