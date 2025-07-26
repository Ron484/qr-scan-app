// import 'package:ajwad_v4/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.textAlign,
      this.fontWeight = FontWeight.w500,
      this.color = black,
      this.textDecoration,
      this.maxlines = 2,
      this.textOverflow,
      this.textDirection,
      this.height,
      this.fontFamily,
      this.fontStyle,
      this.shadows,
      this.softWrap = false,
      this.textDecorationStyle});

  final String? text;
  final double fontSize;
  final bool? softWrap;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? textDecoration;
  final int? maxlines;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final double? height;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextDecorationStyle? textDecorationStyle;
  final List<Shadow>? shadows;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Text(
        text!,
        textAlign: TextAlign.left,
        maxLines: maxlines,
        overflow: textOverflow,
        softWrap: softWrap,
        style: TextStyle(
            fontFamily: fontFamily ?? 'HT Rakik',
            color: color,
            fontSize: fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationStyle: textDecorationStyle,
            height: height,
            shadows: shadows,
            decorationColor: color,
            overflow: TextOverflow.ellipsis,
            decorationThickness: 0.3),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
