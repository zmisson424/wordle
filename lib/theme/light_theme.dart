import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  
  // COLORS
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.backgroundLight,


  // APP BAR
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundLight,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark
    )
  ),


  // SHEETS
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )
    )
  ),


  // TABS
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.primary,
    unselectedLabelColor: Colors.grey.shade900,
    indicator: const BoxDecoration()
  )
);