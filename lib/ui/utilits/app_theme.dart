import 'package:flutter/material.dart';
import 'package:news_app/ui/utilits/app_color.dart';


abstract class AppTheme{
  static const TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.w400,
  fontSize: 22,color: AppColor.white);
  static const TextStyle tackTitleTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 18,color: AppColor.primaryColor);
  static const TextStyle tackDescriptionTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 14,color: AppColor.lightBlack);
  static const TextStyle bottomSheetTitleTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 20,color: AppColor.black);

  static ThemeData lightTheme = ThemeData(
     scaffoldBackgroundColor: AppColor.accentColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.black),
      color: AppColor.primaryColor,
      elevation: 0,
      titleTextStyle: appBarTextStyle
    ),
  );


  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.accentColor,
    appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
        elevation: 0,
        titleTextStyle: appBarTextStyle
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(side: BorderSide(color: AppColor.white,width: 4)),
    ),
    dividerTheme: DividerThemeData(color: AppColor.primaryColor,thickness: 3)

  );














}