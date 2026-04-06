import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';
import '../widgets/color_item_widget.dart';

class WithKeysScreen extends StatefulWidget {
  const WithKeysScreen({super.key});

  @override
  State<WithKeysScreen> createState() => _WithKeysScreenState();
}

class _WithKeysScreenState extends State<WithKeysScreen> {
  final List<Map<String, dynamic>> _items = [
    {'id': UniqueKey(), 'text': 'Blue Item', 'color': AppColors.nelBlue},
    {'id': UniqueKey(), 'text': 'Cyan Item', 'color': AppColors.nelCyan},
    {'id': UniqueKey(), 'text': 'Yellow Item', 'color': AppColors.nelYellow},
    {'id': UniqueKey(), 'text': 'Pink Item', 'color': AppColors.nelPink},
    {'id': UniqueKey(), 'text': 'Orange Item', 'color': Colors.orange},
    {'id': UniqueKey(), 'text': 'Purple Item', 'color': Colors.purple},
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
                AppStrings.explanationWithKeys,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _shuffleItems,
                icon: const Icon(Icons.shuffle),
                label: const Text('Shuffle Items'),
              ),
              const Text(
                '(Shuffle: Items move with their correct Colors!)',
                style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              // KEY used here to maintain State
              return ColorItemWidget(
                key: _items[index]['id'] as Key,
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
