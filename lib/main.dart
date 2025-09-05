import 'package:flutter/material.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/layouts/base_layout.layout.dart';

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
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: whiteTypography),
            backgroundColor: redPrimary.withAlpha((255 * 0.8).toInt()),
            toolbarHeight: 76,
            titleTextStyle: const TextStyle(
              color: whiteTypography,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
          bottomAppBarTheme: const BottomAppBarThemeData(
              elevation: 0,
              shadowColor: Colors.transparent,
              color: widgetBackground,
              padding: EdgeInsets.all(0)),
        ),
        home: const BaseLayout() //const LoginScreen(),
        );
  }
}
