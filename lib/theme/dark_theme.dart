import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  
  // COLORS
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary
  ),
  scaffoldBackgroundColor: AppColors.backgroundDark,



  // APP BAR
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundDark,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light
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
  )
);