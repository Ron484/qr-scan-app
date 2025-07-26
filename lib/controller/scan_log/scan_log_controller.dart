import 'package:get/get.dart';
import 'package:qr_scanner_app/model/scan_log/scan_log_model.dart';
import 'package:qr_scanner_app/service/scan_log/scan_log_service.dart';

class ScanLogController extends GetxController {
  var isVerfiedUserLoading = false.obs;

  var verifiedUser = <ScanLog>[].obs;

  Future<List<ScanLog>?> geVerifiedUsers() async {
    try {
      isVerfiedUserLoading(true);
      final data = await ScanLogService.geVerifiedUsers();

      if (data != null) {
        verifiedUser(data);
        return verifiedUser;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    } finally {
      isVerfiedUserLoading(false);
    }
  }
}
