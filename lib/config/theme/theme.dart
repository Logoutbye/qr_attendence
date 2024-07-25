import 'package:flutter/material.dart';

class Themecolor {
  Themecolor._();

 static const Color primary = Color(0xff02387E );
 static const Color primaryLight = Color(0xff01C4EF);
  static const Color icon = Color(0xFF008000);
  static const Color white = Color(0xFFffffff);
  static const Color whitehalf = Color(0xFFf2f5fe);
  static const Color black = Color(0xFF333333);
  static const Color grey = Colors.grey;
  static const Color red = Color(0xFFFF0000);
  static const Color orange = Colors.orange;
  static const Color flushbar = Color(0xFFb392dd);
     static const Color green = Color(0xFFA5D6A7); 
      static const Color border= Color.fromARGB(255, 213, 219, 213); 
}

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Themecolor.whitehalf,
    brightness: Brightness.light,
    appBarTheme: AppBarThemee.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightTheme,
    textTheme: Themetext.lightTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: Elevatedbuttontheme.lightElevatedButtonTheme,
    bottomSheetTheme: BottomSheetThemee.lightbottomSheetThemeData,
    inputDecorationTheme: Textformfieldtheme.lightinputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Themecolor.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarThemee.darkAppBarTheme,
      checkboxTheme: CustomCheckboxTheme.darkTheme,
      textTheme: Themetext.darkTextTheme,
      useMaterial3: true,
      elevatedButtonTheme: Elevatedbuttontheme.darkElevatedButtonTheme,
      bottomSheetTheme: BottomSheetThemee.darktbottomSheetThemeData,
      inputDecorationTheme: Textformfieldtheme.darkinputDecorationTheme);
}

class Elevatedbuttontheme {
  Elevatedbuttontheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Themecolor.white,
      disabledForegroundColor: Themecolor.grey,
      disabledBackgroundColor: Themecolor.grey,
      side: const BorderSide(color: Themecolor.grey),
      textStyle: const TextStyle(
          fontSize: 16, color: Themecolor.white, fontWeight: FontWeight.w600),
      backgroundColor: Themecolor.primary,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      minimumSize: const Size(327.0, 56.0),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Themecolor.white,
      disabledForegroundColor: Themecolor.grey,
      disabledBackgroundColor: Themecolor.grey,
      side: const BorderSide(color: Themecolor.grey),
      textStyle: const TextStyle(
          fontSize: 16, color: Themecolor.white, fontWeight: FontWeight.w600),
      backgroundColor: Themecolor.primary,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      minimumSize: const Size(327.0, 56.0),
    ),
  );
}

class AppBarThemee {
  AppBarThemee._();
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Themecolor.black, size: 24),
      actionsIconTheme: IconThemeData(color: Themecolor.black, size: 24),
      titleTextStyle: TextStyle(
        color: Themecolor.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ));

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Themecolor.white, size: 24),
      actionsIconTheme: IconThemeData(color: Themecolor.white, size: 24),
      titleTextStyle: TextStyle(
        color: Themecolor.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ));
}

class BottomSheetThemee {
  BottomSheetThemee._();
  static BottomSheetThemeData lightbottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Themecolor.white,
    modalBackgroundColor: Themecolor.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
  static BottomSheetThemeData darktbottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Themecolor.black,
    modalBackgroundColor: Themecolor.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}

class CustomCheckboxTheme {
  static CheckboxThemeData lightTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Themecolor.white;
        } else {
          return Themecolor.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Themecolor.white;
        } else {
          return Themecolor.black;
        }
      }));
  static CheckboxThemeData darkTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Themecolor.black;
        } else {
          return Themecolor.white;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Themecolor.black;
        } else {
          return Themecolor.white;
        }
      }));
}

class Textformfieldtheme {
  Textformfieldtheme._();

  static InputDecorationTheme lightinputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: Themecolor.grey,
    prefixIconColor: Themecolor.grey,
    labelStyle:
        const TextStyle().copyWith(fontSize: 14, color: Themecolor.grey),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Themecolor.grey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal, color: Themecolor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.black)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.orange)),
  );
  static InputDecorationTheme darkinputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: Themecolor.grey,
    prefixIconColor: Themecolor.grey,
    labelStyle:
        const TextStyle().copyWith(fontSize: 14, color: Themecolor.white),
    hintStyle:
        const TextStyle().copyWith(fontSize: 14, color: Themecolor.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal, color: Themecolor.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.whitehalf)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.white)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.white)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Themecolor.orange)),
  );
}

class Themetext {
  Themetext._();
  // static const double smallSize = 12.0;
  // static const double mediumeSize = 14.0;
  // static const double largeSize = 18.0;
  // static const double extraLargeSize = 24.0;

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Themecolor.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Themecolor.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Themecolor.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.black.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.black),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Themecolor.black.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Themecolor.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Themecolor.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Themecolor.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Themecolor.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Themecolor.white.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.white),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Themecolor.white.withOpacity(0.5),
    ),
  );
}

class DropdownTheme {
  DropdownTheme._();

  static InputDecoration lightDecoration = InputDecoration(
    hintText: 'Select Role',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: Themecolor.grey),
    ),
    filled: true,
    fillColor: Themecolor.white,
  );

  static InputDecoration darkDecoration = InputDecoration(
    hintText: 'Select Role',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: Themecolor.grey),
    ),
    filled: true,
    fillColor: Themecolor.black,
  );
}
