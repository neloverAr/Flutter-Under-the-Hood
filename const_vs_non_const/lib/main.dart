import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/constants/colors.dart';
import 'package:const_vs_non_const/core/constants/strings.dart';
import 'package:const_vs_non_const/screens/main_screen.dart';

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
      showPerformanceOverlay: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
