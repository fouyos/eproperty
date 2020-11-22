import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';
import 'custom_sizes.dart';

class CustomTheme {
  static final Color lightFillColor = Colors.black;
  static final Color lightFocusColor = Colors.black.withOpacity(0.12);

  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;

  static ColorScheme lightColorScheme = ColorScheme(
    primary: const Color(0xFFFF6673),
    primaryVariant: const Color(0xFF117378),
    secondary: const Color(0xFFEFF3F3),
    secondaryVariant: const Color(0xFFFAFBFB),
    background: const Color(0xFFE6EBEB),
    surface: const Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: lightFillColor,
    onError: lightFillColor,
    onPrimary: lightFillColor,
    onSecondary: const Color(0xFF322942),
    onSurface: const Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
      fontSize: CustomSizes.TEXT_SIZE_96,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_60,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_48,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_34,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_24,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_20,
      color: CustomColors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_16,
      color: CustomColors.black87,
      fontWeight: semiBold,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_14,
      color: CustomColors.black87,
      fontWeight: semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_16,
      color: CustomColors.black87,
      fontWeight: light,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_14,
      color: CustomColors.black87,
      fontWeight: light,
      fontStyle: FontStyle.normal,
    ),
    button: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_14,
      color: CustomColors.black87,
      fontStyle: FontStyle.normal,
      fontWeight: medium,
    ),
    caption: GoogleFonts.poppins(
      fontSize: CustomSizes.TEXT_SIZE_12,
      color: Colors.white,
      fontWeight: regular,
      fontStyle: FontStyle.normal,
    ),
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      iconTheme: const IconThemeData(color: Colors.white),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: CustomColors.primaryColor,
    );
  }

  ThemeData lightThemeData = themeData(
    lightColorScheme,
    lightFocusColor,
  );
}