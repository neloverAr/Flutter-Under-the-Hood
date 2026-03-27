import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/constants/colors.dart';
import 'package:const_vs_non_const/core/constants/strings.dart';
import 'package:const_vs_non_const/core/models/counter_state.dart';
import 'package:const_vs_non_const/widgets/const_heavy_widget.dart';
import 'package:const_vs_non_const/widgets/non_const_heavy_widget.dart';

class ComparisonView extends StatefulWidget {
  final bool isConst;
  const ComparisonView({super.key, required this.isConst});

  @override
  State<ComparisonView> createState() => _ComparisonViewState();
}

class _ComparisonViewState extends State<ComparisonView> {
  int _rebuildTriggerCounter = 0;

  void _incrementCounter() {
    setState(() {
      _rebuildTriggerCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppStrings.logoPath, height: 80),
            const SizedBox(height: 16),
            Text(
              widget.isConst ? AppStrings.constMode : AppStrings.nonConstMode,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.nelBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              AppStrings.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.nelGrey),
            ),

            const SizedBox(height: 32),

            // Comparing Area
            widget.isConst
                ? const ConstHeavyWidget() // Uses Const
                : NonConstHeavyWidget(),   // NO CONST HERE - Important!

            const SizedBox(height: 32),
            Text(
              '${AppStrings.rebuildCount} ${widget.isConst ? CounterState.constBuilds : CounterState.nonConstBuilds}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('Trigger (setState) Count: $_rebuildTriggerCounter'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.refresh),
              label: const Text(AppStrings.increment),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.nelCyan,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
