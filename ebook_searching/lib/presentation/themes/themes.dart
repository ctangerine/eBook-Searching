import 'package:flutter/material.dart';

const String primaryFontFamily = 'Inter';

class AppColors {
  static const Color maintheme = Color(0xFFFFFFFF);
  static const Color primary = Color.fromARGB(255, 23, 104, 255);
  static const Color onPrimary = Color(0xffffffff);
  static const Color textPrimary = Color.fromARGB(255, 17, 24, 39);
  static const Color textSecondary = Color.fromARGB(255, 156, 163, 175);
  static const Color error = Color.fromARGB(255, 220, 38, 38);
  static const Color themeSecondary = Color.fromARGB(255, 243, 244, 246);
}

class AppTextStyles {
  static const TextStyle heading2Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 34.0/28.0,
  );

  static const TextStyle heading3Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 28.0/24.0,
  );

  static const TextStyle description2Medium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 20.0/14.0,
  );

  static const TextStyle description2Regular = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 20.0/14.0,
  );

  static const TextStyle title1Medium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 18/16.0,
  );

  static const TextStyle title1Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 18/16.0,
  );

  static const TextStyle title2Medium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16/14.0,
  );

  static const TextStyle title2Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 16/14.0,
  );

  static const TextStyle body2Regular = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 16.0/14.0,
  );

  static const TextStyle body2Medium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16.0/14.0,
  );

  static const TextStyle body2Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 16.0/14.0,
  );

  static const TextStyle body3Medium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 14.0/14.0,
  );

  static const TextStyle body3Semibold = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 14.0/14.0,
  );
}

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.maintheme,
  dialogBackgroundColor: AppColors.themeSecondary,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.maintheme,
    headerHeadlineStyle: AppTextStyles.title1Semibold.copyWith(color: AppColors.onPrimary),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),
      errorStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.error),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.textPrimary),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.maintheme,
      focusColor: AppColors.maintheme,
    )
  ),
  textTheme: const TextTheme(
    headlineMedium: AppTextStyles.heading2Semibold,
    headlineSmall: AppTextStyles.heading3Semibold,
    bodyMedium: AppTextStyles.body2Medium,
    bodySmall: AppTextStyles.body3Medium
  ),
  buttonTheme: const ButtonThemeData(
    disabledColor: AppColors.textSecondary,
    buttonColor: AppColors.primary
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(AppTextStyles.title2Semibold.copyWith(color: AppColors.onPrimary)),
      backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
    )
  ),
  outlinedButtonTheme: const OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.textPrimary),
      backgroundColor: WidgetStatePropertyAll(AppColors.maintheme),
      side: WidgetStatePropertyAll(BorderSide(color: Color.fromARGB(173, 101, 101, 101))),
      overlayColor: WidgetStatePropertyAll(Color.fromARGB(173, 101, 101, 101)),
    )
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.textPrimary),
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.textSecondary, width: 1.0)
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary, width: 2.0)
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.error, width: 2.0)
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: AppColors.textSecondary, width: 2.0),
    ),
    hintStyle: const TextStyle(
      fontFamily: primaryFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 16.0/14.0,
      color: AppColors.textSecondary
    ),
    errorStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.error),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.maintheme,
    elevation: 0,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.textPrimary
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimary
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.maintheme,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.maintheme,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
  ),
);