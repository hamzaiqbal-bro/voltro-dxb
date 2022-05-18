import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';
import 'font_family.dart';

class AppStyles {
  AppStyles._();

  // region AppBar Style
  static TextStyle kAppBarStyle = TextStyle(
      color: AppColors.kPrimaryColor,
      fontWeight: FontWeight.w600,
      fontSize: ScreenUtil().setSp(18.0),
      fontFamily: FontFamily.kFontPoppinsRegular);
  // endregion
}
