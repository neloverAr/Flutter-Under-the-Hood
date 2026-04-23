import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/strings.dart';
import '../core/controllers/counter_controller.dart';
import '../widgets/app_logo.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  // Shared State Management (GetX)
  final CounterController controller = Get.find<CounterController>();
  
  // Local UI State (setState)
  bool _showDetails = false;

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
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
              AppStrings.screen2Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            
            // Shared State
            const Text(AppStrings.counterText),
            Obx(() => Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.displayMedium,
                )),
            
            const SizedBox(height: 40),
            const Divider(),
            
            // Local State
            Text(AppStrings.localToggleText),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleDetails,
              child: Text(_showDetails ? AppStrings.hideDetails : AppStrings.showDetails),
            ),
            if (_showDetails)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  AppStrings.detailsMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.blueGrey),
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
