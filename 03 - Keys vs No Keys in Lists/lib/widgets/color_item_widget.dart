import 'dart:math';
import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class ColorItemWidget extends StatefulWidget {
  final String text;
  final VoidCallback onDelete;

  const ColorItemWidget({
    super.key,
    required this.text,
    required this.onDelete,
  });

  @override
  State<ColorItemWidget> createState() => _ColorItemWidgetState();
}

class _ColorItemWidgetState extends State<ColorItemWidget> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    // Assign a random color from our app colors or random
    final colors = [
      AppColors.nelBlue,
      AppColors.nelCyan,
      AppColors.nelYellow,
      AppColors.nelPink,
      Colors.orange,
      Colors.purple,
    ];
    myColor = colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: widget.onDelete,
          ),
        ],
      ),
    );
  }
}
