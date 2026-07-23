import 'package:flutter/material.dart';

/// نظام الألوان الكلاسيكي الوقور للتطبيق القانوني
/// Classic and dignified color system for legal application
class AppColors {
  // ألوان الخلفيات الداكنة / Dark Background Colors
  static const Color darkCharcoal = Color(0xFF2A2A2A); // الرمادي الفحمي الداكن
  static const Color matteBlack = Color(0xFF1A1A1A); // الأسود المخملي
  static const Color lightCharcoal = Color(0xFF3F3F3F); // رمادي فحمي فاتح

  // ألوان النص والأيقونات / Text & Icons Colors
  static const Color softGold = Color(0xFFD4AF37); // البيج الذهبي الناعم
  static const Color antiqueBronze = Color(0xFFB8860B); // النحاس العتيق
  static const Color bronzeLight = Color(0xFFCDA55D); // نحاس فاتح

  // ألوان إضافية / Additional Colors
  static const Color whiteText = Color(0xFFF5F5F5); // أبيض ناعم للنصوص
  static const Color lightGray = Color(0xFFE8E8E8); // رمادي فاتح
  static const Color borderGray = Color(0xFF555555); // رمادي للحدود

  // ألوان الحالة / Status Colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFE74C3C);
  static const Color warningOrange = Color(0xFFF39C12);
  static const Color infoBlue = Color(0xFF3498DB);

  // الوضع الليلي / Dark Mode (نفس الألوان الأساسية)
  static const Color darkModeBg = matteBlack;
  static const Color darkModeText = softGold;

  // الوضع النهاري / Light Mode
  static const Color lightModeBg = Color(0xFFFAF9F6);
  static const Color lightModeText = Color(0xFF2A2A2A);
  static const Color lightModeBronze = Color(0xFFB8860B);
}

class AppTheme {
  // الثيم الداكن - الافتراضي / Dark Theme - Default
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.matteBlack,
      primaryColor: AppColors.softGold,
      primaryColorLight: AppColors.bronzeLight,
      primaryColorDark: AppColors.antiqueBronze,
      canvasColor: AppColors.darkCharcoal,
      
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.matteBlack,
        foregroundColor: AppColors.softGold,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.softGold,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        iconTheme: IconThemeData(color: AppColors.softGold),
      ),

      // Text Themes
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.softGold,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'Segoe UI',
        ),
        displayMedium: TextStyle(
          color: AppColors.softGold,
          fontSize: 26,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        displaySmall: TextStyle(
          color: AppColors.antiqueBronze,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        headlineMedium: TextStyle(
          color: AppColors.softGold,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        titleLarge: TextStyle(
          color: AppColors.softGold,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        titleMedium: TextStyle(
          color: AppColors.whiteText,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Segoe UI',
        ),
        bodyLarge: TextStyle(
          color: AppColors.whiteText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Segoe UI',
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lightGray,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Segoe UI',
          height: 1.5,
        ),
        bodySmall: TextStyle(
          color: AppColors.borderGray,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Segoe UI',
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.darkCharcoal,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.antiqueBronze,
            width: 1,
          ),
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.antiqueBronze,
          foregroundColor: AppColors.whiteText,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Segoe UI',
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.softGold,
          side: const BorderSide(
            color: AppColors.softGold,
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightCharcoal,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.antiqueBronze,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.borderGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.softGold,
            width: 2,
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.antiqueBronze,
          fontFamily: 'Segoe UI',
        ),
        hintStyle: const TextStyle(
          color: AppColors.borderGray,
          fontFamily: 'Segoe UI',
        ),
        prefixIconColor: AppColors.antiqueBronze,
        suffixIconColor: AppColors.antiqueBronze,
      ),

      // BottomNavigationBar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkCharcoal,
        selectedItemColor: AppColors.softGold,
        unselectedItemColor: AppColors.borderGray,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // IconButton Theme
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.softGold;
            }
            return AppColors.antiqueBronze;
          }),
        ),
      ),
    );
  }

  // الثيم الفاتح / Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightModeBg,
      primaryColor: AppColors.lightModeBronze,
      primaryColorLight: AppColors.softGold,
      primaryColorDark: AppColors.antiqueBronze,
      canvasColor: Colors.white,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.lightModeBronze,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.lightModeBronze,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightModeText,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'Segoe UI',
        ),
        displayMedium: TextStyle(
          color: AppColors.lightModeBronze,
          fontSize: 26,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
        bodyLarge: TextStyle(
          color: AppColors.lightModeText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Segoe UI',
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF555555),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Segoe UI',
        ),
      ),

      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.lightModeBronze,
            width: 0.5,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightModeBronze,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFDDDDDD),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightModeBronze,
            width: 2,
          ),
        ),
      ),
    );
  }
}
