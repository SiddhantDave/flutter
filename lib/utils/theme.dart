import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  fontFamily: 'SF Pro Display',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    surface: AppColors.background,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500, // Medium
      color: AppColors.black,
      letterSpacing: -1.5,
      height: 20 / 24, // Line height 20px
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400, // Regular
      color: Color(0xFF2D2D2D),
      letterSpacing: -0.225,
      height: 1.0, // Line height 15px
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0xFF2D2D2D),
      letterSpacing: -0.18,
      height: 16 / 12,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryLight,
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.24),
      ),
      minimumSize: const Size(double.infinity, 50.5),
      padding: EdgeInsets.zero,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
        fontFamily: 'SF Pro Display',
        letterSpacing: -0.24,
        height: 16.86 / 16,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.background,
      side: const BorderSide(color: AppColors.primary, width: 1.124),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.24),
      ),
      minimumSize: const Size(double.infinity, 50.5),
      padding: EdgeInsets.zero,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
        fontFamily: 'SF Pro Display',
        letterSpacing: -0.24,
        height: 16.86 / 16,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.background,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11.24),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.124),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11.24),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.124),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11.24),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.124), // Same width as RN
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0), // Height handled by container usually, but Flutter needs padding
    hintStyle: const TextStyle(
      color: AppColors.primary,
      fontSize: 16,
      fontFamily: 'SF Pro Display',
      letterSpacing: -0.24,
    ),
  ),
);
