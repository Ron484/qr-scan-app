import 'package:flutter/material.dart';
import 'package:qr_scanner_app/app_util/app_util.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/model/scan_log/scan_log_model.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class CustomInfoCard extends StatelessWidget {
  const CustomInfoCard({
    super.key,
    required this.usersScanLog,
  });
  final ScanLog usersScanLog;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.041, vertical: width * 0.012),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(1, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.041, vertical: width * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: usersScanLog.user?.fullName ?? '',
                color: black,
                fontSize: width * 0.038,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                height: 3,
              ),
              const Spacer(),
              CustomText(
                  text: usersScanLog.scanTime!.isEmpty
                      ? ''
                      : AppUtil.formatTimeWithLocale(
                          context, usersScanLog.scanTime ?? ''),
                  color: purple,
                  fontSize: width * 0.038,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
