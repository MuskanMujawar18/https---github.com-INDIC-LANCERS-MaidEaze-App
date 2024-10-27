import 'package:flutter/material.dart';
import 'package:maideaze/ui/global/appBar.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/styles/design.dart';
import 'package:maideaze/ui/utils/constansts.dart';
import 'package:maideaze/ui/utils/imagesDefine.dart';
import 'package:maideaze/ui/utils/labelKeys.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() {
    return _WalletScreenState();
  }
}

class _WalletScreenState extends State<WalletScreen> {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard opens
      appBar: CustomAppBar(
        title: mywalletLbl,
        index: 0,
        toolbarHeight: 70,
        iconSize: 28,
        backgroundColor: white,
        titleColor: Colors.black,
        iconColor: black,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(181, 228, 202, 0.25),
                border: Border.all(color: appColor, width: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(DesignConfig.setPngPath(wallet),
                          height: 24, width: 24, color: appColor),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        walletbalance,
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "₹600.00",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          totalamount,
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              color: black,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          "₹100.00",
                          style: TextStyle(
                              fontFamily: Manrope,
                              fontSize: 12,
                              color: black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Transaction History",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            transactionHistory(
                "Refund Amount", 1000.00, true, "05 May,2024", "07:30 PM"),
            const SizedBox(
              height: 15,
            ),
            transactionHistory(
                "Refund Amount", 1000.00, true, "05 May,2024", "07:30 PM"),
            const SizedBox(
              height: 15,
            ),
            transactionHistory(
                "Refund Amount", 1000.00, true, "05 May,2024", "07:30 PM"),
            const SizedBox(
              height: 15,
            ),
            transactionHistory("Amount paid towards cleaning \nservice", 100.00,
                false, "20 July,2024", "07:30 PM"),
            const SizedBox(
              height: 15,
            ),
            transactionHistory("Amount paid towards cleaning \nservice", 100.00,
                false, "20 July,2024", "07:30 PM"),
          ],
        ),
      ),
    );
  }

  Widget transactionHistory(String amountType, double amount, bool isCredit,
      String date, String time) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greayColor, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                amountType,
                style: TextStyle(
                    fontFamily: Manrope,
                    fontSize: 12,
                    color: black,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "${isCredit ? '+' : '-'} ₹${amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 12,
                  color: isCredit ? appColor : red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$date | $time",
            style: TextStyle(
                fontFamily: Manrope,
                fontSize: 10,
                color: greayLightColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}