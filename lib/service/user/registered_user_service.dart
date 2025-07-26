import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/config/config.dart';
import 'package:qr_scanner_app/model/user/registered_user_model.dart';
import 'package:http/http.dart' as http;

class RegisteredUserService {
  static Future<RegisteredUser?> getUserScan(
      {required BuildContext context, String registerationId = ""}) async {
    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/scan/registered-user/$registerationId'),
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json",
        },
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);
        log('User info: , ${user.toString()}');

        return RegisteredUser.fromJson(user);
      } else {
        String errorMessage = jsonDecode(response.body)['message'];
        log(errorMessage.toString());
        // if (context.mounted) {
        //   //AppUtil.errorToast(context, errorMessage);
        // }
        return null;
      }
    } catch (e) {
      log('Error in getUserScan: $e');
      return null;
    }
  }
}
