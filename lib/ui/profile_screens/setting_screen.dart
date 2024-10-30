import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationOn = true;
  bool isDarkModeOn = false;
  double? height, width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: settingLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Application Settings",
              style: TextStyle(
                color: greayLightColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            // const SizedBox(height: 16),
            _buildSettingOption(
              label: "Notification",
              value: isNotificationOn,
              onChanged: (value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
            ),
            _buildSettingOption(
              label: "Dark Mode",
              value: isDarkModeOn,
              onChanged: (value) {
                setState(() {
                  isDarkModeOn = value;
                });
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, width! / 1.78, 15),
                decoration: BoxDecoration(
                  border: Border.all(color: greayColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Update App Now",
                  style: TextStyle(
                    color: appColor,
                    fontFamily: Manrope,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: greayColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: Manrope,
              fontWeight: FontWeight.w500,
            ),
          ),
          _buildCustomSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildCustomSwitch({
    required bool value,
    required Function(bool) onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 39,
        height: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: value ? appColor : Color(0xffE2E8F0),
        ),
        child: Align(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 14,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
