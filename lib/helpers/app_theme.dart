import 'package:flutter/material.dart';

   final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: const Color(0xfff7f6f0),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xfff7f6f0), titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
      )),
      primarySwatch: Colors.blue,
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      backgroundColor: const Color(0xfff7f6f0),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
      
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
                color: Color(0xff000000),
          ),
          borderRadius: BorderRadius.circular(14)
        )
      )
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: const Color(0xff141518),
      primarySwatch: Colors.teal,
      backgroundColor: const Color(0xff141518),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
       appBarTheme: const AppBarTheme(backgroundColor:  Color(0xff141518), titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
      )),
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      cardTheme:  CardTheme(
        color: const Color(0xff1e1f25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side:  BorderSide(
            width: 1,
                color: Colors.deepPurple.shade200,
          ),
        )
      )
    )
  };

enum AppTheme {
  lightTheme,
  darkTheme,
}
