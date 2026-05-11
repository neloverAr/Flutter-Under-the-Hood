import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';
import '../widgets/stateful_box.dart';

class WithKeysScreen extends StatefulWidget {
  const WithKeysScreen({super.key});

  @override
  State<WithKeysScreen> createState() => _WithKeysScreenState();
}

class _WithKeysScreenState extends State<WithKeysScreen> {
  late List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = [
      const StatefulBox(
        key: ValueKey('A'),
        text: 'Widget A',
        color: AppColors.nelBlue,
      ),
      const StatefulBox(
        key: ValueKey('B'),
        text: 'Widget B',
        color: AppColors.nelYellow,
      ),
    ];
  }

  void _swap() {
    setState(() {
      items.insert(0, items.removeAt(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset('assets/images/logo.png', height: 80),
          const SizedBox(height: 20),
          const Text(
            AppStrings.withKeysTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(AppStrings.withKeysDesc, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _swap,
            child: const Text(AppStrings.swapButton),
          ),
          const Spacer(),
          const Text(
            AppStrings.explanationTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'Notice how both the external color and the internal "Random Color" state swap correctly because Flutter uses the Key to match the Widget with its Element/State.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
