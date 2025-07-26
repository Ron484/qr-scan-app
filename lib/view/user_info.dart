import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/constant/colors.dart';
import 'package:qr_scanner_app/controller/user/registered_user_controller.dart';
import 'package:qr_scanner_app/model/user/registered_user_model.dart';
import 'package:qr_scanner_app/widget/common/custom_app_bar.dart';
import 'package:qr_scanner_app/widget/common/custom_empty_widget.dart';
import 'package:qr_scanner_app/widget/user/custom_feild.dart';
import 'package:qr_scanner_app/widget/common/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfoScreen extends StatefulWidget {
  final String result;

  const UserInfoScreen({super.key, required this.result});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final userController = Get.put(RegisteredUserController());
  RegisteredUser? user;

  Future<void> getUserScaned(
    BuildContext context,
    String id,
  ) async {
    user =
        await userController.getUserScan(context: context, registerationId: id);
  }

  @override
  void initState() {
    super.initState();
    getUserScaned(context, widget.result);
  }

  @override
  // void dispose() {
  //   userController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        backgroundColor: lightGreyBackground,
        appBar: const CustomAppBar(
          'User Information',
          isBack: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.041, vertical: width * 0.06),
              child: Skeletonizer(
                  enabled: userController.isRegisteredUserLoading.value,
                  child: user == null
                      ? const Column(
                          children: [
                            Expanded(
                              child: CustomEmptyWidget(
                                title: 'No matching user found',
                                image: 'paymentFaild.gif',
                                // width: width * 0.26,
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: width * 1.43,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(width: 1, color: lightGrey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.symmetric(vertical: width * 0.1),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [lavender, purple],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: user?.fullName ?? '',
                                    fontFamily: 'HT Rakik',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.051,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              SizedBox(height: width * 0.061),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.061),
                                child: CustomText(
                                  text: 'Contact Details',
                                  color: darkGrey,
                                  fontSize: width * 0.051,
                                  fontFamily: 'HT Rakik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: width * 0.061),

                              // Registration ID
                              CustomFeild(
                                  title: "Registration ID",
                                  value: user?.registrationId ?? ''),
                              SizedBox(height: width * 0.02),
                              CustomFeild(
                                  title: "Email", value: user?.email ?? ''),
                              SizedBox(height: width * 0.02),
                              CustomFeild(
                                  title: "Mobile", value: user?.mobile ?? ''),
                              SizedBox(height: width * 0.02),
                              CustomFeild(
                                  title: "Job Title",
                                  value: user?.jobTitle ?? ''),
                              SizedBox(height: width * 0.02),
                              CustomFeild(
                                  title: "Company", value: user?.company ?? ''),
                            ],
                          ),
                        )),
            ),
          ),
        ));
  }
}
