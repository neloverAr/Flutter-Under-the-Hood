import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/strings.dart';
import '../core/constants/colors.dart';
import '../widgets/performance_metrics.dart';

class GetXControllerLogic extends GetxController {
  var count = 0.obs;
  var rebuilds = 0.obs;

  void increment() {
    count++;
  }

  void incrementRebuilds() {
    rebuilds++;
  }
}

class GetXScreen extends StatelessWidget {
  const GetXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetXControllerLogic controller = Get.put(GetXControllerLogic());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.getxTitle),
        backgroundColor: AppColors.nelCyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 100),
            const SizedBox(height: 20),
            Obx(() {
              return PerformanceMetrics(
                rebuildCount: controller.rebuilds.value,
                widgetsRebuilt: 1, 
                fps: 60.0,
                memoryUsage: '22 MB',
              );
            }),
            const SizedBox(height: 20),
            Obx(() => Text(
                  '${controller.count.value}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.nelCyan),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.increment();
                controller.incrementRebuilds();
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.nelYellow),
              child: const Text(AppStrings.increment),
            ),
          ],
        ),
      ),
    );
  }
}
