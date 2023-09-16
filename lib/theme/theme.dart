import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/theme/colors.dart';

import 'font_size.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarLight,
      titleTextStyle: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.heading.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
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
      bodyLarge: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.heading.sp,
      ),
      bodyMedium: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.normal.sp,
      ),
      bodySmall: TextStyle(
        color: AppColors.dark,
        fontSize: FontSize.small.sp,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      titleTextStyle: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.heading.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
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
      bodyLarge: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.heading.sp,
      ),
      bodyMedium: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.normal.sp,
      ),
      bodySmall: TextStyle(
        color: AppColors.light,
        fontSize: FontSize.small.sp,
      ),
    ),
  );
}
