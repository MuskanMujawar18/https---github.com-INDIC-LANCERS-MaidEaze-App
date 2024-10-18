import 'package:flutter/material.dart';
import 'package:maideazw/ui/global/appBar.dart';
import 'package:maideazw/ui/global/search_field.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/utils/constansts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns items to the start
          children: [
            CustomSearchField(
              hintText: "Search for ‘Cooking services’",
              onPressed: (ctx) {},
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.watch_later_outlined,
                  size: 20,
                  color: appColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "Recent Searches",
                  style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            recentsearches("Cooking services"),
            recentsearches("Cleaning services"),
            recentsearches("Laundry services"),
            Row(
              children: [
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.trending_up,
                  size: 20,
                  color: appColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "Trending Searches",
                  style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            trendingsearches("Cooking services"),
            trendingsearches("Cleaning services"),
            trendingsearches("Laundry services"),
          ],
        ),
      ),
    );
  }

  Widget recentsearches(String searchTopic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                searchTopic,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.close,
              size: 12,
            ),
          ],
        ),
        Divider(
          color: greayLightColor,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget trendingsearches(String searchTopic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                searchTopic,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 16,
            ),
          ],
        ),
        Divider(
          color: greayLightColor,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
