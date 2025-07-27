import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/controller/user/registered_user_controller.dart';
import 'package:qr_scanner_app/view/user_info.dart';
import 'package:qr_scanner_app/widget/common/custom_app_bar.dart';
import 'package:qr_scanner_app/widget/common/custom_button.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final userController = Get.put(RegisteredUserController());

  Future<void> _scanBarcode(BuildContext context) async {
    var options = const ScanOptions(
      android: AndroidOptions(appBarTitle: ''),
      strings: {
        "cancel": "Cancel",
        "flash_on": "Flash On",
        "flash_off": "Flash Off",
      },
    );
    var result = await BarcodeScanner.scan(options: options);
    if (result.type == ResultType.Barcode) {
      Get.to(() => UserInfoScreen(
            result: result.rawContent,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: lightGreyBackground,
      appBar: const CustomAppBar(
        'QR Scan',
        isBack: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.041),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Scan QR Code',
              color: darkGrey,
              fontSize: width * 0.05,
              fontFamily: 'HT Rakik',
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: width * 0.02),
            SizedBox(
              width: double.infinity,
              child: CustomText(
                text: 'Place the QR code properly inside the area',
                color: textGreyColor,
                fontSize: width * 0.043,
                maxlines: 3,
                fontFamily: 'HT Rakik',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: width * 0.051),
            // Scanner with frame
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.circular(width * 0.041),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/qr2.png",
                            width: width * 0.67,
                            height: width * 0.67,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        border: Border.all(color: grayDarkText, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: width * 0.089),
                      child: CustomButton(
                        onPressed: () {
                          _scanBarcode(context);
                          // setState(() {
                          //   showScanner = true;
                          // });
                        },
                        title: 'Scan Now',
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
