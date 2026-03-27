import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/constants/colors.dart';

class HeavyContent extends StatelessWidget {
  final String label;
  const HeavyContent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.nelCyan.withOpacity(0.1),
        border: Border.all(color: AppColors.nelCyan, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Rendering $label Widget',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
              200,
              (index) => Container(
                width: 8,
                height: 8,
                color: index % 2 == 0 ? AppColors.nelBlue : AppColors.nelYellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
