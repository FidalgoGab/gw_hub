import 'package:flutter/material.dart';
import 'package:gw_hub/screens/home/home.screen.dart';
import 'package:gw_hub/ui/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: redPrimary,
              onPrimary: whiteTypography,
              secondary: blackSecondary,
              onSecondary: whiteTypography,
              error: error,
              onError: whiteTypography,
              surface: widgetBackground,
              onSurface: blackTypography,
            ),
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: whiteTypography),
              backgroundColor: redPrimary,
              toolbarHeight: 76,
              titleTextStyle: TextStyle(
                color: whiteTypography,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
                color: widgetBackground, padding: EdgeInsets.all(0))),
        home: HomeScreen() //const LoginScreen(),
        );
  }
}
