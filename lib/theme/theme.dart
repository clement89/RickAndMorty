import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/theme/colors.dart';

import 'font_size.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.large.sp,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.large.sp,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.large.sp,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.large.sp,
      ),
    ),
  );
}
