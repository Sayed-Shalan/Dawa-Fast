import '../helper/launch_flow.dart';
import '../main.dart';
import '../models/user.dart';
import 'base_controller.dart';

abstract class BaseAuthController extends BaseController {

  navigateTo() async {
    EFlowType flowType = await LaunchFlow.flow();
    switch (flowType) {
      case EFlowType.userGuide:
        // Get.offAllNamed(Routes.userGuide);
        break;
      case EFlowType.auth:
        // Get.offAllNamed(Routes.login);
        break;
      case EFlowType.home:
        // Get.offAllNamed(Routes.home);
        break;
    }
  }

  saveUser({required User user,bool keepLoggedIn = false}){
    pref.user = user;
  }

}
