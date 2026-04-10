import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/strings.dart';
import '../core/constants/colors.dart';
import '../widgets/performance_metrics.dart';

class ProviderCounter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  int _rebuilds = 0;
  int get rebuilds => _rebuilds;

  void increment() {
    _count++;
    _rebuilds++;
    notifyListeners();
  }
}

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderCounter(),
      child: const ProviderView(),
    );
  }
}

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  int _widgetsRebuilt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.providerTitle),
        backgroundColor: AppColors.nelBlue,
      ),
      body: Consumer<ProviderCounter>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 100),
                const SizedBox(height: 20),
                PerformanceMetrics(
                  rebuildCount: provider.rebuilds,
                  widgetsRebuilt: _widgetsRebuilt,
                  fps: 60.0,
                  memoryUsage: '25 MB',
                ),
                const SizedBox(height: 20),
                Text(
                  '${provider.count}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.nelBlue),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _widgetsRebuilt++;
                    });
                    provider.increment();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.nelYellow),
                  child: const Text(AppStrings.increment),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
