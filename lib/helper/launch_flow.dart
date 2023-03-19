import 'package:get/get.dart';
import 'auth_helper.dart';

class LaunchFlow {
  /// We add ignore email as user can skip this step ***
  static Future<EFlowType> flow() async {
    var authHelper = Get.find<AuthHelper>();
    if (!authHelper.isLoggedIn()) return EFlowType.auth;
    return EFlowType.home;
  }
}

enum EFlowType { userGuide, auth, home,  }
