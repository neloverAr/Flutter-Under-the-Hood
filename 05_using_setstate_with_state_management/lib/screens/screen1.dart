import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/strings.dart';
import '../core/controllers/counter_controller.dart';
import '../widgets/app_logo.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // Shared State Management (GetX)
  final CounterController controller = Get.find<CounterController>();
  
  // Local UI State (setState)
  bool _isHighlighted = false;

  void _toggleHighlight() {
    setState(() {
      _isHighlighted = !_isHighlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 20),
            Text(
              AppStrings.screen1Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            
            const Text(AppStrings.counterText),
            Obx(() => Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.displayMedium,
                )),
            
            const SizedBox(height: 40),
            const Divider(),
            const Text(AppStrings.localToggleText),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _toggleHighlight,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: _isHighlighted ? Colors.yellow.withOpacity(0.3) : Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Tap to Highlight this box (Local UI State)'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: AppStrings.incrementTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
