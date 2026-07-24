import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const FirstScreen(),
    );
  }
}