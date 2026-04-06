import 'package:flutter/material.dart';
import '../core/constants/strings.dart';
import '../widgets/color_item_widget.dart';

class NoKeysScreen extends StatefulWidget {
  const NoKeysScreen({super.key});

  @override
  State<NoKeysScreen> createState() => _NoKeysScreenState();
}

class _NoKeysScreenState extends State<NoKeysScreen> {
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

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
            AppStrings.explanationNoKeys,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              // NO KEY used here
              return ColorItemWidget(
                text: _items[index],
                onDelete: () => _removeItem(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
