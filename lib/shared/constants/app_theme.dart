import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'font_family.dart';

final ThemeData themeData =  ThemeData(

    fontFamily: FontFamily.kFontPoppinsRegular,
    primaryColor: AppColors.kPrimaryColor,

   colorScheme: const ColorScheme.light(
     background: AppColors.kwWhiteColor,
     brightness: Brightness.light,
   ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.kwWhiteColor,
    unselectedItemColor: AppColors.greyColor,
    selectedIconTheme: IconThemeData(color: AppColors.greyColor),
  ),
     backgroundColor: AppColors.kPrimaryColor,
);



