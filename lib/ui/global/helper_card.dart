import 'package:flutter/material.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/styles/design.dart';
import 'package:maideazw/ui/utils/constansts.dart';

class TopHelperCard extends StatelessWidget {
  final String name;
  final String distance;
  final double rating;
  final String price;
  final bool isFavorite;
  final String imageUrl;
  final String rank;

  const TopHelperCard({
    Key? key,
    required this.name,
    required this.distance,
    required this.rating,
    required this.price,
    required this.isFavorite,
    required this.imageUrl,
    required this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greayColor)),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(DesignConfig.setPngPath(imageUrl))),
        title: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontFamily: Manrope,
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            if (rank == 'gold') ...[
              Image.asset(
                DesignConfig.setPngPath("crown_golden"),
                height: 12,
                width: 12,
              )
            ] else if (rank == 'silver') ...[
              Image.asset(
                DesignConfig.setPngPath("crown_silver"),
                height: 12,
                width: 12,
              )
            ],
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("location_outlined"),
                    height: 10,
                    width: 10,
                    color: greayLightColor,
                  ),
                  Text(
                    ' $distance away',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: Manrope,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: greayLightColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  price,
                  style: const TextStyle(
                      fontFamily: Manrope,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: appColor),
                )),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 153, 0, 0.15),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    DesignConfig.setPngPath("star"),
                    height: 12,
                    width: 12,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    '$rating',
                    style: const TextStyle(
                        fontFamily: Manrope,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFF9900)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Icon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
              size: 20,
            ),
          ],
        ),
        onTap: () {
          // Handle card tap if necessary
        },
        selected: isFavorite,
      ),
    );
  }
}
