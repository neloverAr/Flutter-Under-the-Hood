import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';

class SharedPrefsScreen extends StatefulWidget {
  const SharedPrefsScreen({super.key});

  @override
  State<SharedPrefsScreen> createState() => _SharedPrefsScreenState();
}

class _SharedPrefsScreenState extends State<SharedPrefsScreen> {
  final _controller = TextEditingController();
  String _displayData = AppStrings.noData;
  String _log = "Ready to write (Async)";

  @override
  void initState() {
    super.initState();
    _readData();
  }

  // لاحظ استخدام async و await هنا
  Future<void> _saveData() async {
    if (_controller.text.isNotEmpty) {
      final startTime = DateTime.now().microsecondsSinceEpoch;
      
      final prefs = await SharedPreferences.getInstance(); // انتظر الاتصال بالنظام الأصلي
      await prefs.setString(AppStrings.storageKey, _controller.text); // انتظر الكتابة
      
      final endTime = DateTime.now().microsecondsSinceEpoch;
      
      await _readData(); // قراءة محدثة
      
      setState(() {
        _log = "Execution time: ${endTime - startTime} µs (Async communication)";
      });
      
      _controller.clear();
      if (mounted) FocusScope.of(context).unfocus();
    }
  }

  Future<void> _readData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _displayData = prefs.getString(AppStrings.storageKey) ?? AppStrings.noData;
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppStrings.storageKey);
    await _readData();
    setState(() => _log = "Storage Cleared (Async)");
    if (mounted) FocusScope.of(context).unfocus();
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
              AppStrings.sharedPrefsTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.nelBlue),
            ),
            const SizedBox(height: 10),
            const Text(AppStrings.sharedPrefsDesc, textAlign: TextAlign.center),
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
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.nelBlue),
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
            Text(_log, style: const TextStyle(color: AppColors.nelBlue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(AppStrings.dataLabel, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.nelYellow.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.nelYellow),
              ),
              child: Text(
                _displayData,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: AppColors.nelBlue),
              ),
            ),
            const SizedBox(height: 30),
            const Card(
              color: Colors.blueGrey,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'ASYNC: Every operation requires "await" because Flutter needs to talk to the Native OS (Android/iOS).',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
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
