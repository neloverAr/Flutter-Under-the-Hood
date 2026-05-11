import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';
import '../widgets/stateful_box.dart';

class NoKeysScreen extends StatefulWidget {
  const NoKeysScreen({super.key});

  @override
  State<NoKeysScreen> createState() => _NoKeysScreenState();
}

class _NoKeysScreenState extends State<NoKeysScreen> {
  late List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = [
      const StatefulBox(text: 'Widget A', color: AppColors.nelBlue),
      const StatefulBox(text: 'Widget B', color: AppColors.nelYellow),
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
            AppStrings.noKeysTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(AppStrings.noKeysDesc, textAlign: TextAlign.center),
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
            'Notice how the external colors (passed as parameters) swap, but the internal "Random Color" state stays in place because the Elements are reused by type.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
