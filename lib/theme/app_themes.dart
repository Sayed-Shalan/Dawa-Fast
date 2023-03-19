import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  /// Rounded shape ************************************************************
  static var shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: kWhite,
        cardColor: kWhite,
        primaryColor: kPrimary,
        indicatorColor: kPrimary,
        dividerColor: kBlack,
        cardTheme: CardTheme(
            elevation: 16,
            color: kWhite,
            shape: shape,
            margin: EdgeInsets.zero),
        appBarTheme: const AppBarTheme(
            color: kWhite, iconTheme: IconThemeData(color: kBlack)),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: kBlack,
            fontFamily: kBlackBold,
          ),
          displayMedium: TextStyle(
            color: kBlack,
            fontFamily: kBold,
          ),
          displaySmall: TextStyle(
            color: kPrimary,
            fontFamily: kBold2,
          ),
          headlineMedium: TextStyle(
            color: kBlack,
            fontFamily: kHeavy,
          ),
          headlineSmall: TextStyle(
            color: kPurple32,
            fontFamily: kMedium,
          ),
          titleLarge: TextStyle(
              color: kGreyB7,
              fontFamily: kRegular,
              fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(
              color: kBlack, fontFamily: kLight, fontWeight: FontWeight.normal),
          labelLarge:
              TextStyle(color: kWhite, fontSize: 16, fontFamily: kMedium),
        ),
      );
}

late String kBlackBold;
late String kBold;
late String kBold2;
late String kHeavy;
late String kMedium;
late String kRegular;
late String kLight;

initFonts({String? lngCode}) {
  kBlackBold = 'BlackBold';
  kBold = 'Bold';
  kBold2 = 'Bold2';
  kHeavy = 'Heavy';
  kMedium = 'Medium';
  kRegular = 'Regular';
  kLight = 'Light';
}
