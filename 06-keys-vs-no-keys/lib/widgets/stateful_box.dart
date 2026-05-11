import 'dart:math';
import 'package:flutter/material.dart';
import '../core/constants/strings.dart';

class StatefulBox extends StatefulWidget {
  final String text;
  final Color color;

  const StatefulBox({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  State<StatefulBox> createState() => _StatefulBoxState();
}

class _StatefulBoxState extends State<StatefulBox> {
  late Color _internalColor;

  @override
  void initState() {
    super.initState();
    // This state is initialized only once when the Element is created.
    _internalColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(8),
      color: widget.color, // Color from parent
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              AppStrings.stateLostLabel,
              style: TextStyle(color: Colors.white, fontSize: 10),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _internalColor, // Internal state color
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
