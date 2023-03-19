import 'package:get/get.dart';
import '../screens/splash/splash_bindings.dart';
import '../screens/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),
  ];
}
