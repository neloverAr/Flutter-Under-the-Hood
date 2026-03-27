import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/models/counter_state.dart';
import 'package:const_vs_non_const/widgets/heavy_content.dart';

class ConstHeavyWidget extends StatelessWidget {
  const ConstHeavyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CounterState.constBuilds++;
    return const HeavyContent(label: 'CONST');
  }
}
