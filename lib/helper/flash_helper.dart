import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import '../theme/app_themes.dart';

class FlashHelper {
  static void showTopFlash(String? msg,
      {bool persistent = true,
        Color bckColor = kRed,
        String title = "",
        bool showDismiss = false}) {
    showFlash(
      context: Get.context!,
      duration: const Duration(seconds: 5),
      persistent: persistent,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: bckColor,
          brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 0)],
          barrierBlur: 0.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: FlashBehavior.fixed,
          position: FlashPosition.top,
          child: FlashBar(
            title: title.isEmpty
                ? null
                : Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kWhite,
                  height: 1.5,
                  fontFamily: kBold,
                  fontSize: 16),
            ),
            content: Center(
              child: Text(msg != null && msg.isNotEmpty ? msg : 'Error',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: kWhite,
                      fontFamily: kBlackBold,
                      fontSize: 14)),
            ),
            showProgressIndicator: false,
            primaryAction: null,
          ),
        );
      },
    );
  }
}
