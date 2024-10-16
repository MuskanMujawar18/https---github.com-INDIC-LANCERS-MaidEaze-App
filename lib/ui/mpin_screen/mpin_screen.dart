import 'package:flutter/material.dart';
import 'package:maideazw/ui/home_screen/home_page.dart';
import 'package:maideazw/ui/styles/color.dart';
import 'package:maideazw/ui/utils/constansts.dart';
import 'package:maideazw/ui/utils/labelKeys.dart';

class MpinScreen extends StatefulWidget {
  const MpinScreen({super.key});

  @override
  State<MpinScreen> createState() => _MpinScreenState();
}

class _MpinScreenState extends State<MpinScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  void _checkMpin() {
    String mpin = _controllers.map((e) => e.text).join('');
    if (mpin.length == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  Widget _buildMpinField(int index, FocusNode focusNode, FocusNode nextFocus) {
    return Container(
      height: 40,
      width: 40,
      child: TextField(
        controller: _controllers[index],
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
          _checkMpin();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              mpinLbl,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: Manrope),
            ),
            const SizedBox(height: 11),
            const Text(
              mpinsubLbl,
              style: TextStyle(
                  fontSize: 14,
                  color: greayLightColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: Manrope),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMpinField(0, _focusNode1, _focusNode2),
                const SizedBox(width: 20),
                _buildMpinField(1, _focusNode2, _focusNode3),
                const SizedBox(width: 20),
                _buildMpinField(2, _focusNode3, _focusNode4),
                const SizedBox(width: 20),
                _buildMpinField(3, _focusNode4,
                    FocusNode()), // Last one doesn't have a next focus
              ],
            ),
            const Spacer(),
            Icon(
              Icons.fingerprint,
              color: appColor,
              size: 40,
            ),
            const SizedBox(height: 8),
            const Text(
              "Use fingerprint",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: Manrope),
            ),
            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}
