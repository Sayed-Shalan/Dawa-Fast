import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PageAttributes {
  //Data
  final String? title;
  final bool showAppBar, resizeToAvoidBottomInset, transparentAppBar;
  final double appBarElevation;
  final Color backBtnColor;
  final Color appBarColor;
  final Color titleColor;
  final double? toolbarHeight;
  final bool isHome;
  final double? titleSpacing;
  final bool centerTitle;

  PageAttributes(
      {this.backBtnColor = kPurple32,
      this.showAppBar = true,
      this.appBarElevation = 0,
      this.transparentAppBar = false,
      this.toolbarHeight,
      this.isHome = false,
      this.title,
      this.titleColor = kPurple32,
      this.appBarColor = kWhite,
      this.resizeToAvoidBottomInset = false,
      this.titleSpacing,
      this.centerTitle = true});
}
