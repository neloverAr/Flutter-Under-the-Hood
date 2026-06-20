import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'core/constants/strings.dart';
import 'screens/layout_explanation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LayoutExplanationScreen(),
    );
  }
}
