import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';

class AppFonts {
  static const String primaryFontFamily = 'Inter'; // Fuente predeterminada
  static const String secondFontFamily = 'JotiOne'; // Fuente predeterminada
  static const String subtitleFontFamily = 'Roboto'; // Fuente predeterminada

  static const TextStyle heading1Style = TextStyle(
      fontFamily: subtitleFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 36,
      // color: AppColors.textColor,
      color: AppColors.textColor1);
  static const TextStyle heading2Style = TextStyle(
      fontFamily: subtitleFontFamily,
      //fontWeight: FontWeight.bold,
      fontSize: 25,
      color: AppColors.textColor3);
  static const TextStyle heading3Style = TextStyle(
    fontFamily: primaryFontFamily,
    //fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.textColor2,
  );
  static const TextStyle subtitle = TextStyle(
      fontFamily: subtitleFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor1);
}
