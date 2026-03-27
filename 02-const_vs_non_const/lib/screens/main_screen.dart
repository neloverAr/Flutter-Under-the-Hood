import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/constants/colors.dart';
import 'package:const_vs_non_const/core/constants/strings.dart';
import 'package:const_vs_non_const/screens/comparison_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        backgroundColor: AppColors.nelBlue,
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ComparisonView(isConst: true),
          ComparisonView(isConst: false),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: AppStrings.constTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: AppStrings.nonConstTab,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.nelBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
