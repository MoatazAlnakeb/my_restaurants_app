import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_restaurant_app/general/general_constants.dart';

ThemeData ? darkThemd =  ThemeData(
  primarySwatch:Colors.deepOrange,
  scaffoldBackgroundColor: Color(General.getColorHexFromStr('333739')),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle:SystemUiOverlayStyle(
        statusBarColor: Color(General.getColorHexFromStr('333739')),
        statusBarIconBrightness: Brightness.light
    ),
    backgroundColor: Color(General.getColorHexFromStr('333739')),
    elevation:0.0,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(
        color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Color(General.getColorHexFromStr('333739')),
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 16,
        fontFamily: 'SFProDisplay-Regular',
        // fontWeight: FontWeight.w600,
        color: Colors.white,
      )
  ),
);

ThemeData lightTheme = ThemeData(
    primarySwatch:Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation:0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 16,
          fontFamily: 'SFProDisplay-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )
    )
);