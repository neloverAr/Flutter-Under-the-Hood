import 'package:flutter/material.dart';
import '../core/constants/strings.dart';
import '../widgets/color_item_widget.dart';

class WithKeysScreen extends StatefulWidget {
  const WithKeysScreen({super.key});

  @override
  State<WithKeysScreen> createState() => _WithKeysScreenState();
}

class _WithKeysScreenState extends State<WithKeysScreen> {
  // Use unique IDs for keys to maintain state correctly
  final List<Map<String, dynamic>> _items = List.generate(
    10,
    (index) => {'id': UniqueKey(), 'text': 'Item ${index + 1}'},
  );

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppStrings.explanationWithKeys,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              // KEY used here to maintain State
              return ColorItemWidget(
                key: _items[index]['id'] as Key,
                text: _items[index]['text'] as String,
                onDelete: () => _removeItem(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
