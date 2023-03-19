import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'di/initial_bindings.dart';
import 'local/localization_service.dart';
import 'navigation/app_pages.dart';
import 'theme/app_themes.dart';

int kNumOfNav = 0;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      title: LocalizationService.isRtl() ? 'Plans' : 'Plans',
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
      locale: LocalizationService.getCurrentLocale(),
      fallbackLocale: LocalizationService.fallbackLocale,
      home: null,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      translations: LocalizationService(),
      routingCallback: (Routing? route) => route == null ||
              route.isBlank! ||
              route.isBottomSheet! ||
              route.isDialog!
          ? kNumOfNav
          : route.isBack!
              ? kNumOfNav--
              : kNumOfNav++,
    );
  }
}
