import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackgroundColor = Color.fromARGB(255, 240, 240, 243);
const kPrimaryColor = Color(0xffFFFFFF);
const kBackgroundColorContrast = Color(0xffF5F5F5);
const kAccentGreyBlue = Color(0xff849DAD);
const kAccentGreyBlueDark = Color(0xff5A7485);
const kAccentGreen = Color.fromARGB(255, 54, 141, 127);
const kAccentLightGreen = Color(0xffC2EFDF);
const kAccentRed = Color(0xffFD5A58);
const kAccentRedPale = Color(0xffE68788);
const kAccentRedLight = Color(0xffFFC6D3);
const kAccentBlue = Color(0xff007EF4);
const kBlackTextLightMode = Color(0xff404040);
const kBlackTextDarkMode = Color(0xffE3E3E3);
const kBackgroundColorDark = Color(0xff141C1C);
const kBackgroundColorDarkContrast = Color(0xff313431);
const kAccentBluePale = Color(0xffBAEEFF);
ThemeData get darkThemeData {
  final textColor = kBlackTextDarkMode; // Use the dark mode text color
  final robotoFontFamily =
      GoogleFonts.roboto().fontFamily; // Get the Roboto font family
  return ThemeData(
    primaryColor: kBackgroundColorDarkContrast,
    scaffoldBackgroundColor: kBackgroundColorDark,
    bottomAppBarColor: kBackgroundColorDarkContrast,
    textTheme: TextTheme(
        displayLarge: TextStyle(
          color: textColor,
          fontSize: 50,
          fontWeight: FontWeight.w500,
          fontFamily: robotoFontFamily,
        ),
        displayMedium: TextStyle(
          color: textColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
          fontFamily: robotoFontFamily,
        ),
        displaySmall: TextStyle(
          color: textColor,
          fontSize: 23,
          fontWeight: FontWeight.w500,
          fontFamily: robotoFontFamily,
        ),
        headlineLarge: TextStyle(
          color: textColor,
          fontSize: 25,
          fontWeight: FontWeight.w400,
          fontFamily: robotoFontFamily,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: robotoFontFamily,
        ),
        headlineSmall: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: robotoFontFamily,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: robotoFontFamily,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: robotoFontFamily,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: robotoFontFamily,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w300,
          fontFamily: robotoFontFamily,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: robotoFontFamily,
        ),
        bodySmall: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w300,
          fontFamily: robotoFontFamily,
        )),
    // Add more theme customization as needed
  );
}

ThemeData get lightThemeData {
  final textColor = kBlackTextLightMode; // Use the light mode text color
  final robotoFontFamily =
      GoogleFonts.roboto().fontFamily; // Get the Roboto font family

  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    bottomAppBarColor: kBackgroundColorContrast,

    textTheme: TextTheme(
        displayLarge: TextStyle(
            color: textColor,
            fontSize: 50,
            fontWeight: FontWeight.w500,
            fontFamily: robotoFontFamily),
        displayMedium: TextStyle(
            color: textColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: robotoFontFamily),
        displaySmall: TextStyle(
            color: textColor,
            fontSize: 23,
            fontWeight: FontWeight.w500,
            fontFamily: robotoFontFamily),
        headlineLarge: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
            fontFamily: robotoFontFamily),
        headlineMedium: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: robotoFontFamily),
        headlineSmall: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: robotoFontFamily),
        titleLarge: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: robotoFontFamily),
        titleMedium: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: robotoFontFamily),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          fontFamily: robotoFontFamily,
        ),
        bodyLarge: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
            fontFamily: robotoFontFamily),
        bodyMedium: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: robotoFontFamily),
        bodySmall: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w300,
            fontFamily: robotoFontFamily)),
    // Add more theme customization as needed
  );
}
