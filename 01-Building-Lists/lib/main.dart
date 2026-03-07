import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
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
      title: 'List Comparison',
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
  String _buildTime = 'Measuring...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Performance'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _buildTime = 'Measuring...';
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue.withOpacity(0.1),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Build Time: $_buildTime',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _buildTime = 'Measuring...';
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.unfold_more),
            label: 'Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Builder',
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
        final time = '${stopwatch.elapsedMilliseconds} ms';
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
