import 'package:flutter/material.dart';
import 'my_list_item.dart';

class ColumnScreen extends StatelessWidget {
  final int itemCount;
  const ColumnScreen({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          itemCount,
          (index) => MyListItem(index: index, type: 'Column'),
        ),
      ),
    );
  }
}
