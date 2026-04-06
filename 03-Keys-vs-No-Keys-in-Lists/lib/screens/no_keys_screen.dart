import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';
import '../widgets/color_item_widget.dart';

class NoKeysScreen extends StatefulWidget {
  const NoKeysScreen({super.key});

  @override
  State<NoKeysScreen> createState() => _NoKeysScreenState();
}

class _NoKeysScreenState extends State<NoKeysScreen> {
  final List<Map<String, dynamic>> _items = [
    {'text': 'Blue Item', 'color': AppColors.nelBlue},
    {'text': 'Cyan Item', 'color': AppColors.nelCyan},
    {'text': 'Yellow Item', 'color': AppColors.nelYellow},
    {'text': 'Pink Item', 'color': AppColors.nelPink},
    {'text': 'Orange Item', 'color': Colors.orange},
    {'text': 'Purple Item', 'color': Colors.purple},
  ];

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _shuffleItems() {
    setState(() {
      _items.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                AppStrings.explanationNoKeys,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _shuffleItems,
                icon: const Icon(Icons.shuffle),
                label: const Text('Shuffle Items'),
              ),
              const Text(
                '(Shuffle: Names change, but Colors stay in place!)',
                style: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              // NO KEY used here
              return ColorItemWidget(
                text: _items[index]['text'],
                initialColor: _items[index]['color'],
                onDelete: () => _removeItem(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
