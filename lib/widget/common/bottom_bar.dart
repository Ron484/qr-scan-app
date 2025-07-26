import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/controller/user/registered_user_controller.dart';
import 'package:qr_scanner_app/view/scan_qr.dart';
import 'package:qr_scanner_app/view/verified_user.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, this.pageNumber = 0});
  final int pageNumber;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  PageController? _pageController;
  final userController = Get.put(RegisteredUserController());

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageNumber);

    userController.bottomBar(widget.pageNumber);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [ScanQrScreen(), VerifiedUserScreen()],
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(bottom: width * 0.010),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 40,
              color: shadowColor,
              // color: Color.fromRGBO(33, 33, 33, 0.05),
              offset: Offset(10, 0))
        ]),
        child: Obx(
          () => BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            backgroundColor: Colors.white,
            currentIndex: userController.bottomBar.value,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor:graytext,
            selectedItemColor: lavender,
            unselectedLabelStyle: TextStyle(
              fontSize: width * 0.031,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro',
            ),
            selectedLabelStyle: TextStyle(
              fontSize: width * 0.031,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro',
            ),
            onTap: (index) {
              userController.bottomBar.value = index;
              _pageController!.jumpToPage(userController.bottomBar.value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  decoration: userController.bottomBar.value == 0
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [],
                        )
                      : const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: RepaintBoundary(
                      child: Icon(
                        CupertinoIcons.barcode_viewfinder,
                        size: 24,
                        color: userController.bottomBar.value == 0
                            ? darkPurple
                            : grayDarkText,
                      ),
                    ),
                  ),
                ),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: userController.bottomBar.value == 1
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [],
                        )
                      : const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: RepaintBoundary(
                      child: Icon(
                        CupertinoIcons.person_crop_circle_badge_checkmark,
                        size: 24,
                        color: userController.bottomBar.value == 1
                            ? darkPurple
                            :  grayDarkText,
                      ),
                    ),
                  ),
                ),
                label: 'Verified user'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
