import 'package:flutter/material.dart';

class ColorItemWidget extends StatefulWidget {
  final String text;
  final Color initialColor;
  final VoidCallback onDelete;

  const ColorItemWidget({
    super.key,
    required this.text,
    required this.initialColor,
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
    // نخزن اللون في الـ State عند البداية فقط
    // وهذا هو سبب "المشكلة" في No Keys: الـ State بتبقى والـ Widget بيتغير
    myColor = widget.initialColor;
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
