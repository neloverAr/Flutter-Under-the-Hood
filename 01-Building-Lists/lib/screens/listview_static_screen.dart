import 'package:flutter/material.dart';
import 'my_list_item.dart';

class ListViewStaticScreen extends StatelessWidget {
  final int itemCount;
  const ListViewStaticScreen({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        itemCount,
        (index) => MyListItem(index: index, type: 'Static'),
      ),
    );
  }
}
