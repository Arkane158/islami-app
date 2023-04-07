import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryLightColor = Color.fromRGBO(183, 147, 95, 1);
  static const Color primaryDarkColor = Color.fromRGBO(20, 26, 46, 1);
  static const Color yellow = Color.fromRGBO(250, 204, 29, 1);

  static final ThemeData lightTheme = ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)))),
      cardColor: Colors.white,
      textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 14, color: Colors.black),
          headlineMedium: TextStyle(fontSize: 22, color: Colors.black),
          titleLarge: TextStyle(fontSize: 28, color: Colors.black)),
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 36)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryLightColor));

  static final ThemeData darkTheme = ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: primaryDarkColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)))),
      cardColor: primaryDarkColor,
      textTheme: const TextTheme(
          titleSmall: TextStyle(fontSize: 14, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 22, color: Colors.white),
          titleLarge: TextStyle(fontSize: 28, color: Colors.white)),
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedLabelStyle: TextStyle(color: Colors.white),
          selectedLabelStyle: TextStyle(color: yellow),
          selectedItemColor: yellow,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 36)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: yellow));
}
