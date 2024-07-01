import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFa279d7);
  static const Color flushbar = Color(0xFFb392dd);

  // static const Color icon = Color(0xFF008000);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF333333);

  static const Color whitehalf = Color(0xFFf2f5fe);
  static const Color grey = Colors.grey;
  static const Color red = Color(0xFFFF0000);
  static const Color orange = Colors.orange;
}

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whitehalf,
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
      scaffoldBackgroundColor: AppColors.black,
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
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.grey,
      disabledBackgroundColor: AppColors.grey,
      side: const BorderSide(color: AppColors.grey),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600),
      backgroundColor: AppColors.primary,
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
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.grey,
      disabledBackgroundColor: AppColors.grey,
      side: const BorderSide(color: AppColors.grey),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600),
      backgroundColor: AppColors.primary,
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
      iconTheme: IconThemeData(color: AppColors.black, size: 24),
      actionsIconTheme: IconThemeData(color: AppColors.black, size: 24),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ));

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white, size: 24),
      actionsIconTheme: IconThemeData(color: AppColors.white, size: 24),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ));
}

class BottomSheetThemee {
  BottomSheetThemee._();
  static BottomSheetThemeData lightbottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.white,
    modalBackgroundColor: AppColors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
  static BottomSheetThemeData darktbottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.black,
    modalBackgroundColor: AppColors.black,
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
          return AppColors.white;
        } else {
          return AppColors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.white;
        } else {
          return AppColors.black;
        }
      }));
  static CheckboxThemeData darkTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.black;
        } else {
          return AppColors.white;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.black;
        } else {
          return AppColors.white;
        }
      }));
}

class Textformfieldtheme {
  Textformfieldtheme._();

  static InputDecorationTheme lightinputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: AppColors.grey,
    prefixIconColor: AppColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.grey),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.grey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal, color: AppColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.black)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.orange)),
  );
  static InputDecorationTheme darkinputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: AppColors.grey,
    prefixIconColor: AppColors.grey,
    labelStyle:
        const TextStyle().copyWith(fontSize: 14, color: AppColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal, color: AppColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.whitehalf)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.white)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.white)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.orange)),
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
      color: AppColors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.black),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black.withOpacity(0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.white.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColors.white),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.white.withOpacity(0.5),
    ),
  );
}

class DropdownTheme {
  DropdownTheme._();

  static InputDecoration lightDecoration = InputDecoration(
    hintText: 'Select Role',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: AppColors.grey),
    ),
    filled: true,
    fillColor: AppColors.white,
  );

  static InputDecoration darkDecoration = InputDecoration(
    hintText: 'Select Role',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: AppColors.grey),
    ),
    filled: true,
    fillColor: AppColors.black,
  );
}
