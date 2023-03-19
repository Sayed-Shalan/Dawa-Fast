import 'dart:async';
import 'package:flutter/material.dart';
import '../base/base_repository.dart';
import '../screens/splash/splash_controller.dart';


bool isFullScreenNotification = false;

class DeepLinkHandler extends BaseRepository {

  static void navigate(Map message, {bool isAccepted = false}) {

    Timer.periodic(const Duration(milliseconds: 700), (Timer t) async {
      if (splashLoaded) {
        destination(message, isAccepted: isAccepted);
        t.cancel();
      }
    });
  }



  static destination(Map message, {bool isAccepted = false}) async {
    debugPrint("Inside deeplink destination ---------------> ${message.toString()}");


  }

  /// Nav **********************************************************************

}
