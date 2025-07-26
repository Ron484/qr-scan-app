import 'dart:convert';
import 'dart:developer';

import 'package:qr_scanner_app/config/config.dart';
import 'package:qr_scanner_app/model/scan_log/scan_log_model.dart';
import 'package:http/http.dart' as http;

class ScanLogService {
  static Future<List<ScanLog>?> geVerifiedUsers() async {
    try {
      final response = await http.get(
        Uri.parse('${Config.baseUrl}/scan-user'),
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json",
        },
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        List<dynamic> users = jsonDecode(response.body);

        log('Verified users: , ${users.toString()}');

        return users.map((user) => ScanLog.fromJson(user)).toList()
          ..sort((a, b) => b.scanTime!.compareTo(a.scanTime??''));
      } else {
        String errorMessage = jsonDecode(response.body)['message'];

        log(errorMessage.toString());

        return null;
      }
    } catch (e) {
      log('Error in getUserScan: $e');

      return null;
    }
  }
}
