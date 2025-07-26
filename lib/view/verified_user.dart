import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/controller/scan_log/scan_log_controller.dart';
import 'package:qr_scanner_app/widget/common/custom_app_bar.dart';
import 'package:qr_scanner_app/widget/common/custom_empty_widget.dart';
import 'package:qr_scanner_app/widget/scan_log/custom_info_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VerifiedUserScreen extends StatefulWidget {
  const VerifiedUserScreen({
    super.key,
  });

  @override
  State<VerifiedUserScreen> createState() => _VerifiedUserScreenState();
}

class _VerifiedUserScreenState extends State<VerifiedUserScreen> {
  final scanLogController = Get.put(ScanLogController());

  @override
  void initState() {
    scanLogController.geVerifiedUsers();
    super.initState();
  }

  // @override
  // void dispose() {
  //   scanLogController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: lightGreyBackground,
      appBar: CustomAppBar(
        "Verifed User".tr,
      ),
      body: 
       Stack(
        children: [
            Column(
              children: [
                SizedBox(
                  height: width * 0.051,
                ),
                Expanded(
                  child:  Obx(
        () =>  Skeletonizer(
                        enabled: scanLogController.isVerfiedUserLoading.value,
                        child: scanLogController.verifiedUser.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: width * 0.6,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.041),
                                      child: const CustomEmptyWidget(
                                        title: 'No User Scans Today',
                                        icon: CupertinoIcons.person_circle_fill,
                                        subtitle:
                                            'All users scanned today will appear here.',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                itemCount: scanLogController.verifiedUser.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: width * 0.01,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return CustomInfoCard(
                                    usersScanLog:
                                        scanLogController.verifiedUser[index],
                                  );
                                })),
                  ),
                ),
              ],
            ),
          ],
        ),
      
    );
  }
}
