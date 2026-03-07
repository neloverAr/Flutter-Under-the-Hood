import 'package:flutter/material.dart';
import 'my_list_item.dart';

class ListViewBuilderScreen extends StatelessWidget {
  final int itemCount;
  const ListViewBuilderScreen({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return MyListItem(index: index, type: 'Builder');
      },
    );
  }
}
