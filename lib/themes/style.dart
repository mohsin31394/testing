
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testing_task/themes/colors.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: AppColors.primary,

      backgroundColor: isDarkTheme ? AppColors.black : AppColors.colorFAF2F2,
      bottomAppBarColor: isDarkTheme ? AppColors.color555555 : AppColors.white,

      indicatorColor: isDarkTheme ? AppColors.black : AppColors.white,
      unselectedWidgetColor: isDarkTheme ? AppColors.colorDBDBDB : AppColors.color707070,
      selectedRowColor: AppColors.colorED1C62,

      hintColor: isDarkTheme ? AppColors.white : AppColors.black,

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );

  }
}

textStyle(fontSize,appFontWeight,color,{underline=false}){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: appFontWeight,
    color: color,
    decoration: underline? TextDecoration.underline:null,
  );
}