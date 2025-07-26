import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class CustomFeild extends StatelessWidget {
  final String title;
  final String value;

  const CustomFeild({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.061),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: textGreyColor,
            fontSize: width * 0.038,
            maxlines: 200,
            fontFamily: 'HT Rakik',
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: lightGrey,
                  width: 1.0,
                ),
              ),
            ),
            child: CustomText(
              text: value,
              color: black,
              fontSize: width * 0.038,
              maxlines: 200,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
