import 'package:flutter/material.dart';
import '../core/constants/strings.dart';
import '../core/constants/colors.dart';

class PerformanceMetrics extends StatelessWidget {
  final int rebuildCount;
  final int widgetsRebuilt;
  final double fps;
  final String memoryUsage;

  const PerformanceMetrics({
    super.key,
    required this.rebuildCount,
    required this.widgetsRebuilt,
    required this.fps,
    required this.memoryUsage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.nelCyan.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.nelCyan),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MetricRow(label: AppStrings.rebuildCount, value: '$rebuildCount'),
          _MetricRow(label: AppStrings.widgetCount, value: '$widgetsRebuilt'),
          _MetricRow(label: AppStrings.fps, value: '${fps.toStringAsFixed(1)}'),
          _MetricRow(label: AppStrings.memory, value: memoryUsage),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetricRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: AppColors.nelBlue)),
        ],
      ),
    );
  }
}
