import 'package:flutter/material.dart';
import 'package:const_vs_non_const/core/models/counter_state.dart';
import 'package:const_vs_non_const/widgets/heavy_content.dart';

class NonConstHeavyWidget extends StatelessWidget {
  // Removing const from the constructor for the non-const comparison
  const NonConstHeavyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CounterState.nonConstBuilds++;
    return HeavyContent(label: 'NON-CONST');
  }
}
