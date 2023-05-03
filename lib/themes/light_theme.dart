import 'package:flutter/material.dart';

Map<int, Color> secondarySwatch = {
  50: const Color(0xffEDEDEC),
  100: const Color(0xffD2D2D0),
  200: const Color(0xffB4B4B1),
  300: const Color(0xff959692),
  400: const Color(0xff7F807A),
  500: const Color(0xff686963),
  600: const Color(0xff60615B),
  700: const Color(0xff555651),
  800: const Color(0xff4B4C47),
  900: const Color(0xff3A3B35)
};

Map<int, Color> tertiarySwatch = {
  50: const Color(0xffEDEDEC),
  100: const Color(0xffD2D2D0),
  200: const Color(0xffB4B4B1),
  300: const Color(0xff959692),
  400: const Color(0xff7F807A),
  500: const Color(0xff686963),
  600: const Color(0xff60615B),
  700: const Color(0xff555651),
  800: const Color(0xff4B4C47),
  900: const Color(0xff3A3B35)
};

Map<int, Color> errorSwatch = {
  50: const Color(0xffFEEAE9),
  100: const Color(0xffFCC1BD),
  200: const Color(0xffFA9891),
  300: const Color(0xffF76E64),
  400: const Color(0xffF54538),
  500: const Color(0xffF31B0C),
  600: const Color(0xffDE190B),
  700: const Color(0xffC7160A),
  800: const Color(0xff9B1108),
  900: const Color(0xff6E0C05)
};

Map<int, Color> accentSwatch = {
  50: const Color(0xffFFFBE8),
  100: const Color(0xffFFF3B9),
  200: const Color(0xffFFD98B),
  300: const Color(0xffFFCA5D),
  400: const Color(0xffFFBB2E),
  500: const Color(0xffFFAC00),
  600: const Color(0xffD1AE00),
  700: const Color(0xffA28700),
  800: const Color(0xff746000),
  900: const Color(0xff463A00)
};

Color primaryColor = Colors.blue;
Color bodyBackground = const Color(0xFFFFFFFF);
Color fontBlack = const Color.fromARGB(255, 49, 49, 49);

MaterialColor secondaryColor =
    MaterialColor(secondarySwatch[500]!.value, secondarySwatch);

MaterialColor tertiaryColor =
    MaterialColor(tertiarySwatch[500]!.value, tertiarySwatch);

MaterialColor errorColor = MaterialColor(errorSwatch[500]!.value, errorSwatch);

final ThemeData themeLight = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: bodyBackground,
  primaryColor: primaryColor,
  fontFamily: 'Roboto',
  appBarTheme: AppBarTheme(
    color: primaryColor,
    titleTextStyle: TextStyle(
      color: secondaryColor,
      fontSize: 19,
    ),
    centerTitle: true,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    height: 66,
    padding: EdgeInsets.all(5),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(height: 64 / 57, fontSize: 57, color: fontBlack),
    displayMedium: TextStyle(height: 52 / 45, fontSize: 45, color: fontBlack),
    displaySmall: TextStyle(height: 44 / 36, fontSize: 36, color: fontBlack),
    headlineLarge: TextStyle(height: 40 / 32, fontSize: 32, color: fontBlack),
    headlineMedium: TextStyle(
      height: 36 / 28,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: fontBlack,
    ),
    headlineSmall: TextStyle(height: 32 / 24, fontSize: 24, color: fontBlack),
    titleLarge: TextStyle(
      height: 28 / 22,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: fontBlack,
    ),
    titleMedium: TextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      color: fontBlack,
    ),
    titleSmall: TextStyle(
      height: 20 / 14,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: fontBlack,
    ),
    bodyLarge: TextStyle(
      height: 24 / 16,
      fontSize: 16,
      letterSpacing: 0.5,
      color: fontBlack,
    ),
    bodyMedium: TextStyle(
      height: 20 / 14,
      fontSize: 14,
      letterSpacing: 0.25,
      color: fontBlack,
    ),
    bodySmall: TextStyle(
      height: 16 / 12,
      fontSize: 12,
      letterSpacing: 0.4,
      color: fontBlack,
    ),
    labelLarge: TextStyle(
      height: 20 / 14,
      fontSize: 14,
      letterSpacing: 0.1,
      color: fontBlack,
    ),
    labelMedium: TextStyle(
      height: 16 / 12,
      fontSize: 12,
      letterSpacing: 0.5,
      color: fontBlack,
    ),
    labelSmall: TextStyle(
      height: 16 / 11,
      fontSize: 11,
      letterSpacing: 0.4,
      color: fontBlack,
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primaryContainer: primaryColor,
    secondaryContainer: secondaryColor,
    tertiaryContainer: tertiaryColor,
    errorContainer: errorColor,
    onPrimaryContainer: Colors.white,
    onSecondaryContainer: Colors.white,
    onTertiaryContainer: Colors.white,
    onErrorContainer: Colors.white,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    tertiary: tertiaryColor,
    onTertiary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    background: bodyBackground,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.white,
  ),
  listTileTheme: ListTileThemeData(
    tileColor: bodyBackground,
  ),
);
