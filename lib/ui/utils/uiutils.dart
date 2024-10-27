import 'package:flutter/material.dart';
import 'package:maideaze/ui/styles/color.dart';
import 'package:maideaze/ui/utils/constansts.dart';

class UiUtils {
  static void setSnackBar(
      String title, String msg, BuildContext context, bool showAction,
      {Function? onPressedAction,
      Duration? duration,
      required String type,
      bool? isFloating}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 54.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(msg,
                textAlign: showAction ? TextAlign.start : TextAlign.start,
                maxLines: 2,
                style: const TextStyle(
                  color: white,
                  fontSize: 14.0,
                  fontFamily: Manrope,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: isFloating != null && !isFloating
          ? SnackBarBehavior.fixed
          : SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor:
          type == "1" ? appColor : Theme.of(context).colorScheme.error,
      action: showAction
          ? SnackBarAction(
              label: "Retry",
              onPressed: onPressedAction as void Function(),
              textColor: white,
            )
          : null,
      elevation: 2.0,
    ));
  }

  static String? validateEmail(String value, String? msg1, String? msg2) {
    if (value.isEmpty) {
      return msg1;
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
            r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+"
            r"[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return msg2;
    } else {
      return null;
    }
  }
}
