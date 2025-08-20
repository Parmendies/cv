import 'package:cv/constants/constants.dart';
import 'package:cv/screens/main_page.dart';
import 'package:flutter/material.dart';

// App Constants

void main() {
  runApp(CVWebsite());
}

class CVWebsite extends StatelessWidget {
  const CVWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV - Minimal Portfolio',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      home: MainPage(),

      themeMode: ThemeMode.system, // veya MainPage’den kontrol edeceksin
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppConstants.lightBackground,
      fontFamily: AppConstants.fontFamily,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppConstants.lightTextPrimary),
        bodyMedium: TextStyle(color: AppConstants.lightTextPrimary),
        headlineLarge: TextStyle(color: AppConstants.lightTextPrimary),
        headlineMedium: TextStyle(color: AppConstants.lightTextPrimary),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppConstants.darkBackground,
      fontFamily: AppConstants.fontFamily,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppConstants.darkTextPrimary),
        bodyMedium: TextStyle(color: AppConstants.darkTextPrimary),
        headlineLarge: TextStyle(color: AppConstants.darkTextPrimary),
        headlineMedium: TextStyle(color: AppConstants.darkTextPrimary),
      ),
    );
  }
}
