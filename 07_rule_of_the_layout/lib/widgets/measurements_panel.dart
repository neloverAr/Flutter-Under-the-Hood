import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';

class MeasurementsPanel extends StatelessWidget {
  final BoxConstraints incomingConstraints;
  final Size childSize;

  const MeasurementsPanel({
    super.key,
    required this.incomingConstraints,
    required this.childSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.nelBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.measurements,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _measurementRow(
            AppStrings.parentConstraintsInfo,
            _formatConstraints(incomingConstraints),
            Colors.red.shade100,
          ),
          const SizedBox(height: 8),
          _measurementRow(
            AppStrings.childSizeInfo,
            '${childSize.width.toInt()} x ${childSize.height.toInt()}',
            Colors.green.shade100,
          ),
        ],
      ),
    );
  }

  Widget _measurementRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  String _formatConstraints(BoxConstraints c) {
    String formatValue(double v) => v.isInfinite ? '∞' : v.toInt().toString();
    return 'w(${formatValue(c.minWidth)}-${formatValue(c.maxWidth)}), h(${formatValue(c.minHeight)}-${formatValue(c.maxHeight)})';
  }
}
