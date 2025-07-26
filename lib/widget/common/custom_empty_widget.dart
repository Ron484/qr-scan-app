import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget(
      {super.key,
      required this.title,
      this.image,
      this.icon,
      this.subtitle = '',
      this.height,
      this.width});

  final String title;
  final String? subtitle;
  final String? image;
  final double? width;
  final double? height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.21),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 34,
                color: grayDarkText,
              ),
              SizedBox(
                height: width * 0.015,
              ),
            ],
            if (image != null) ...[
              Image.asset(
                'assets/images/$image',
                // width: width,
                // height: height,
              ),
              SizedBox(
                height: width * 0.015,
              ),
            ],
            CustomText(
              text: title,
              color: grayDarkText,
              fontSize: width * 0.051,
              fontFamily: 'HT Rakik',
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            if (subtitle != '') ...[
              SizedBox(
                height: width * 0.01,
              ),
              CustomText(
                text: subtitle!,
                color: graytext,
                maxlines: 3,
                fontSize: width * 0.044,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                height: 0,
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
