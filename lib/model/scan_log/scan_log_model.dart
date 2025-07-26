import 'package:qr_scanner_app/model/user/registered_user_model.dart';

class ScanLog {
  final String? scanTime;
  final bool? isScanned;
  final String? registrationId;
  final String? createdAt;
  final String? updatedAt;
  final RegisteredUser? user;

  ScanLog({
    this.isScanned,
    this.scanTime,
    this.createdAt,
    this.updatedAt,
    this.registrationId,
    this.user,
  });

  factory ScanLog.fromJson(Map<String, dynamic> json) {
    return ScanLog(
      registrationId: json['registrationID'] ?? "",
      isScanned: json['isScanned'] ?? false,
      scanTime: json['scanTime'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      user: RegisteredUser.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'registration_id': registrationId,
      'is_scanned': isScanned,
      'scan_time': scanTime
    };
  }
}
