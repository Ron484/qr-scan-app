import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class AppUtil {
  static void showEroreDialog(BuildContext context, text) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/paymentFaild.gif', width: 38),
                CustomText(
                  text: text,
                  fontSize: 15,
                ),
              ],
            ),
          );
        });
  }
 //convert dateTime to time format
  static String formatTimeWithLocale(
      BuildContext context, String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('jm').format(dateTime);
    return formattedTime;
  }
}
