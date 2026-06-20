import 'package:flutter/material.dart';
import '../core/constants/enums.dart';

class LivePreview extends StatelessWidget {
  final ParentType selectedParent;
  final Widget demoWidget;
  final Size childSize;

  const LivePreview({
    super.key,
    required this.selectedParent,
    required this.demoWidget,
    required this.childSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid, width: 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Visualization of Parent Constraints area (Max 200x200 for demo)
            if (selectedParent == ParentType.tight || selectedParent == ParentType.loose)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.withOpacity(0.5), width: 2),
                  color: Colors.red.withOpacity(0.05),
                ),
              ),
            // The Actual Layout
            demoWidget,
            // Green Overlay for child size
            IgnorePointer(
              child: Container(
                width: childSize.width,
                height: childSize.height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
