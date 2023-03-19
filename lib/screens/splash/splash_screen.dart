import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base/base_view.dart';
import '../../models/api/page_attributes.dart';
import '../../theme/app_images.dart';
import 'splash_controller.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends BaseView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  PageAttributes get pageAttributes => PageAttributes(showAppBar: false);

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Center(
        child: Obx(
              () => AnimatedOpacity(
            opacity: controller.logoOpacity.value,
            duration: const Duration(seconds: 3),
            curve: Curves.linear,
            child: Center(
              child: SvgPicture.asset(AppImages.logo),
            ),
          ),
        ),
      ),
    );
  }
}
