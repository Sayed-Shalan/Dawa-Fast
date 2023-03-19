import 'package:get/get.dart';
import '../../base/base_auth_controller.dart';
import '../../base/base_repository.dart';


bool splashLoaded = false;

class SplashController extends BaseAuthController
    with GetSingleTickerProviderStateMixin {
  @override
  BaseRepository? get repository => null;

  /// Data *********************************************************************
  var logoOpacity = 0.0.obs; //widget opacity observable
  Worker? _worker;

  /// Lifecycle methods ********************************************************
  @override
  onResume() {
    _startTimer();
    logoOpacity.value += 1;
  }

  
  @override
  onDestroy() {
    // Disposal of observables from a Controller are done automatically when the Controller is removed from memory
    //So no need to remove currentOpacity.obs subscribers ;) .
    _worker?.dispose();
  }

  /// Logic ********************************************************************

  //Wait 2 seconds then navigate to next page
  _startTimer() {
    _worker = debounce(logoOpacity, (_) => finishSplash(),
        time: const Duration(seconds: 3));
  }

  finishSplash() async {
    navigateTo();
    // Get.toNamed(Routes.technicalSupport);
  }
}
