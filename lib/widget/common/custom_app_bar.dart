import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.title, {
    super.key,
    this.color,
    this.iconColor,
    this.backgroundColor,
    this.isBack = false,
  }) : preferredSize = const Size.fromHeight(75.0);

  final String title;
  final Color? color;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool isBack;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return PreferredSize(
        preferredSize: Size.fromHeight(width * 0.20),
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: AppBar(
              forceMaterialTransparency: true,
              backgroundColor: backgroundColor ?? Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: EdgeInsets.only(
                    top: width * 0.044,
                    left: 0,
                    right: 0,
                    bottom: width * 0.038),
                child: CustomText(
                  text: title,
                  color: color ?? black,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.05,
                  fontFamily: 'HT Rakik',
                ),
              ),
              centerTitle: true,
              leading: isBack
                  ? Padding(
                      padding: EdgeInsets.only(
                          bottom: width * 0.059,
                          left: width * 0.044,
                          top: width * 0.021),
                      child: IconButton(
                        icon: Icon(
                        CupertinoIcons.back,
                          size: 24,
                          color: iconColor ?? Colors.black,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    )
                  : Container(),
            )));
  }
}
