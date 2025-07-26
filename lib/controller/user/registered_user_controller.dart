import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/model/user/registered_user_model.dart';
import 'package:qr_scanner_app/service/user/registered_user_service.dart';

class RegisteredUserController extends GetxController {
  // var registeredUser = RegisteredUser().obs;
  var isRegisteredUserLoading = false.obs;
  var bottomBar = 0.obs;

  Future<RegisteredUser?> getUserScan(
      {required BuildContext context, String registerationId = ""}) async {
    try {
      isRegisteredUserLoading(true);
      var registeredUser = (await RegisteredUserService.getUserScan(
          context: context, registerationId: registerationId));
      return registeredUser;
    } catch (e) {
      return null;
    } finally {
      isRegisteredUserLoading(false);
    }
  }
}
