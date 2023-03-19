import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/api/page_attributes.dart';
import '../theme/app_colors.dart';

mixin ViewMixin {
  ///Data
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ///Getter &Setters
  PageAttributes get pageAttributes;

  Widget buildPage(BuildContext context) {
    return WillPopScope(onWillPop: onPopup, child: buildScaffold(context));
  }

  ///Build widgets methods
  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
        key: pageAttributes.isHome ? scaffoldKey : null,
        extendBodyBehindAppBar: pageAttributes.transparentAppBar,
        drawerDragStartBehavior: DragStartBehavior.start,
        appBar: buildAppBar(),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: GestureDetector(
            onTap: () {
              if (Get.context != null) {
                FocusScope.of(Get.context!).requestFocus(FocusNode());
              }
            },
            child: buildBody(context)),
        drawer: buildDrawer(),
        bottomNavigationBar: buildBottomBar(context),
        bottomSheet: buildSheet(),
        floatingActionButton: buildFloatButton(),
        resizeToAvoidBottomInset: pageAttributes.resizeToAvoidBottomInset);
  }

  ///get app-bar ***************************************************************
  AppBar? buildAppBar() {
    if (!pageAttributes.showAppBar) return null;

    return AppBar(
      bottom: buildBottomAppBar(),
      backgroundColor: pageAttributes.transparentAppBar
          ? Colors.transparent
          : pageAttributes.appBarColor,
      centerTitle: pageAttributes.centerTitle,
      elevation: pageAttributes.appBarElevation,
      actions: buildAppbarActions(),
      iconTheme: IconThemeData(color: pageAttributes.titleColor),
      titleSpacing: pageAttributes.titleSpacing ?? 0,
      toolbarHeight: pageAttributes.toolbarHeight,
      leading: buildBackButton(),
      title: pageAttributes.title != null ? buildAppBarTitle() : null,
      titleTextStyle: Get.textTheme.headlineSmall?.copyWith(
        color: kPurple32,
        fontSize: 20,
      ),
    );
  }

  ///Abstract - instance  methods to do extra work after init

  //set tool actions
  List<Widget> buildAppbarActions() {
    return [];
  }

  Widget? buildBackButton() {
    return Get.key.currentState!.canPop()
        ? Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 24,
                ),
                color: pageAttributes.backBtnColor,
                onPressed: () {
                  onPopup();
                },
              ),
            ],
          )
        : null;
  }

  //Build Drawer
  Widget? buildDrawer() {
    return null;
  }

  //Build Your Custom Body
  Widget? buildBody(BuildContext context) {
    return null;
  }

  Widget? buildBottomBar(BuildContext context) {
    return null;
  }

  Widget? buildSheet() {
    return null;
  }

  PreferredSize? buildBottomAppBar() {
    return null;
  }

  Widget? buildFloatButton() {
    return null;
  }

  onNotificationIcClick() {}

  Widget buildAppBarTitle() {
    return Text(
      pageAttributes.title ?? '',
      style: Get.textTheme.headlineSmall?.copyWith(
        fontSize: 20,
        color: pageAttributes.titleColor,
      ),
    );
  }

  ///POP **************************
  Future<bool> onPopup() {
    Get.back();
    return Future.value(true);
  }
}
