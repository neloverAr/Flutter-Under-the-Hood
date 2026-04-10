import 'package:flutter/material.dart';
import 'provider_screen.dart';
import 'getx_screen.dart';
import '../core/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProviderScreen(),
    GetXScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'GetX',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.nelBlue,
        unselectedItemColor: AppColors.nelGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
