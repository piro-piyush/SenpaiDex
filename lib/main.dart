import 'package:flutter/material.dart';
import 'package:senpai_dex/config/routes/routes.dart';
import 'package:senpai_dex/config/theme/app_theme.dart';
import 'package:senpai_dex/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        onGenerateRoute: onGenerateRoute);
  }
}
