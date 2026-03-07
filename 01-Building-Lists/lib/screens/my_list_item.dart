import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final int index;
  final String type;

  const MyListItem({super.key, required this.index, required this.type});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('$index')),
      title: Text('Item $index'),
      subtitle: Text('Mode: $type'),
    );
  }
}
