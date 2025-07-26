import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.borderColor,
    required this.title,
    this.customWidth,
    this.height,
    this.fontSize = 20,
    this.italic = false,
    this.textColor,
    this.raduis,
  });

  final VoidCallback? onPressed;
  final String title;
  final double? customWidth;
  final double? height;
  final bool italic;
  final Color? textColor;
  final double? raduis;
  final Color? borderColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [lavender, purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(width * 0.031),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(raduis ?? 8),
              ),
              side: borderColor == null
                  ? BorderSide.none
                  : BorderSide(color: borderColor ?? Colors.white),
            ),
          ),
          fixedSize: WidgetStateProperty.all(
              Size(customWidth ?? width, height ?? width * 0.013)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            if (title != "")
              if (textColor == null)
                CustomText(
                  text: title,
                  fontFamily: 'HT Rakik',
                  textAlign: TextAlign.center,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                ),
            if (textColor != null)
              CustomText(
                text: title,
                textAlign: TextAlign.center,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor!,
                fontFamily: 'HT Rakik',
                fontStyle: italic ? FontStyle.italic : FontStyle.normal,
              ),
            if (title == "") const Spacer(),
          ],
        ),
      ),
    );
  }
}
