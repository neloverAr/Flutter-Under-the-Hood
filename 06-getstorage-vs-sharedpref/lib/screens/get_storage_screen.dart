import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';

class GetStorageScreen extends StatefulWidget {
  const GetStorageScreen({super.key});

  @override
  State<GetStorageScreen> createState() => _GetStorageScreenState();
}

class _GetStorageScreenState extends State<GetStorageScreen> {
  final _box = GetStorage();
  final _controller = TextEditingController();
  String _displayData = AppStrings.noData;
  String _log = "Ready to write (Sync)";

  @override
  void initState() {
    super.initState();
    _readData();
  }

  // لاحظ: لا توجد كلمة async هنا! GetStorage يعمل بشكل تزامني
  void _saveData() {
    if (_controller.text.isNotEmpty) {
      final startTime = DateTime.now().microsecondsSinceEpoch;
      
      _box.write(AppStrings.storageKey, _controller.text); // Write
      _displayData = _box.read(AppStrings.storageKey) ?? AppStrings.noData; // Read
      
      final endTime = DateTime.now().microsecondsSinceEpoch;
      
      setState(() {
        _log = "Execution time: ${endTime - startTime} µs (Instant)";
      });
      
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  void _readData() {
    setState(() {
      _displayData = _box.read(AppStrings.storageKey) ?? AppStrings.noData;
    });
  }

  void _clearData() {
    _box.remove(AppStrings.storageKey);
    _readData();
    setState(() => _log = "Storage Cleared");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 80),
            const SizedBox(height: 20),
            const Text(
              AppStrings.getStorageTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.nelBlue),
            ),
            const SizedBox(height: 10),
            const Text(AppStrings.getStorageDesc, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: AppStrings.hintText,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveData, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(AppStrings.saveButton),
                ),
                ElevatedButton(
                  onPressed: _clearData,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  child: const Text(AppStrings.clearButton),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(_log, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(AppStrings.dataLabel, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.nelCyan.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.nelCyan),
              ),
              child: Text(
                _displayData,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: AppColors.nelBlue),
              ),
            ),
            const SizedBox(height: 30),
            const Card(
              color: Colors.amberAccent,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'SYNC: In the code, we read and write without "await". The UI updates immediately because data is in memory.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
