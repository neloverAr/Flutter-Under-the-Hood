import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'core/constants/strings.dart';
import 'screens/column_screen.dart';
import 'screens/listview_static_screen.dart';
import 'screens/listview_builder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: const ComparisonHome(),
    );
  }
}

class ComparisonHome extends StatefulWidget {
  const ComparisonHome({super.key});

  @override
  State<ComparisonHome> createState() => _ComparisonHomeState();
}

class _ComparisonHomeState extends State<ComparisonHome> {
  int _selectedIndex = 0;
  final int _itemCount = 1000;
  String _buildTime = AppStrings.measuring;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
              errorBuilder: (context, error, stackTrace){
                return const Icon(Icons.broken_image);
              },
            ),
            const Text(AppStrings.appBarTitle),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _buildTime = AppStrings.measuring;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '${AppStrings.buildTimeLabel}$_buildTime',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildSelectedList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _buildTime = AppStrings.measuring;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.unfold_more),
            label: AppStrings.navColumn,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: AppStrings.navListView,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: AppStrings.navBuilder,
          ),
        ],
      ),
    );
  }


  Widget _buildSelectedList() {
    final stopwatch = Stopwatch()..start();
    
    Widget content;
    switch (_selectedIndex) {
      case 0:
        content = ColumnScreen(itemCount: _itemCount);
        break;
      case 1:
        content = ListViewStaticScreen(itemCount: _itemCount);
        break;
      case 2:
        content = ListViewBuilderScreen(itemCount: _itemCount);
        break;
      default:
        content = const SizedBox.shrink();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        stopwatch.stop();
        final time = '${stopwatch.elapsedMilliseconds}${AppStrings.msUnit}';
        if (_buildTime != time) {
          setState(() {
            _buildTime = time;
          });
        }
      }
    });

    return content;
  }
}
