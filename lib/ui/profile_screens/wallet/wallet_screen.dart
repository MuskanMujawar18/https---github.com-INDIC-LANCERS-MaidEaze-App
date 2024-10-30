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
  double walletBalance = 100.0;
  double winningamount = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: true,
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
            // Wallet Balance Card
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
                      const SizedBox(width: 8),
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
                        "₹${walletBalance.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontFamily: Manrope,
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
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
                          "₹${winningamount.toStringAsFixed(2)}",
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
            const SizedBox(height: 24),

            const Text(
              "Transaction History",
              style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),

            walletBalance > 0 ? _buildTransactionHistory() : _buildNoData(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      children: [
        const SizedBox(height: 5),
        transactionHistory(
            "Refund Amount", 1000.00, true, "05 May,2024", "07:30 PM"),
        const SizedBox(height: 15),
        transactionHistory(
            "Refund Amount", 100.00, true, "05 May,2024", "07:30 PM"),
        const SizedBox(height: 15),
        transactionHistory(
            "Refer Amount", 2000.00, true, "20 July,2024", "07:30 PM"),
        const SizedBox(height: 15),
        transactionHistory("Amount paid towards cleaning \nservice", 100.00,
            false, "05 May,2024", "07:30 PM"),
        const SizedBox(height: 15),
        transactionHistory("Amount paid towards cleaning \nservice", 400.00,
            false, "05 May,2024", "07:30 PM"),
      ],
    );
  }

  Widget _buildNoData() {
    return Column(
      children: [
        SizedBox(height: height! * 0.15),
        Center(
          child: Column(
            children: [
              Image.asset(
                DesignConfig.setPngPath(attendance_image),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 16),
              Text(
                "No transactions happened yet!",
                style: TextStyle(
                  fontFamily: Manrope,
                  fontSize: 12,
                  color: greayLightColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
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
          const SizedBox(height: 5),
          Text(
            "$date | $time",
            style: const TextStyle(
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
