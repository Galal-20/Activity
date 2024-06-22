import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimaryColor = Color(0xFF00F151);
  static const Color darkPrimaryColor = Color(0xFF00F151);
  //static const Color darkPrimaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    primaryColor: lightPrimaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 30),
        enableFeedback: false
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 18,
        color: Colors.black
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        color: Colors.green,
        fontWeight: FontWeight.bold
      ),
        titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        titleMedium: TextStyle(
          color: Colors.black,
        ),
    ),

  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    primaryColor: darkPrimaryColor,
    cardColor: const Color(0xFF141922),
    scaffoldBackgroundColor: Colors.black12,
    textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
          labelSmall: TextStyle(
              fontSize: 18,
              color: Colors.green,
              fontWeight: FontWeight.bold
          ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        titleMedium: TextStyle(
          color: Colors.white,
        )
      ),
    dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(Colors.grey)
        )
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF141922),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 30),enableFeedback: false
    ),
  );
}