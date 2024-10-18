import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/styles/color.dart';

class TopHelper extends StatefulWidget {
  const TopHelper({super.key});

  @override
  State<TopHelper> createState() {
    return _TopHelperState();
  }
}

class _TopHelperState extends State<TopHelper> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
          //title: "",
          index: 0,
          toolbarHeight: 70,
          iconSize: 28,
          backgroundColor: white,
          titleColor: Colors.black,
          iconColor: black,
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [],
          ),
        ));
  }
}
