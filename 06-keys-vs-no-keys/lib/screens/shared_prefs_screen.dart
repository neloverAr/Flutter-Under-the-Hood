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

  @override
  void initState() {
    super.initState();
    _readData();
  }

  Future<void> _saveData() async {
    if (_controller.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppStrings.storageKey, _controller.text);
      _readData();
      _controller.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved with SharedPreferences (Async)')),
        );
      }
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
    _readData();
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
              ElevatedButton(onPressed: _saveData, child: const Text(AppStrings.saveButton)),
              ElevatedButton(
                onPressed: _clearData,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text(AppStrings.clearButton),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(AppStrings.dataLabel, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.nelYellow.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.nelYellow),
            ),
            child: Text(
              _displayData,
              style: const TextStyle(fontSize: 18, color: AppColors.nelBlue),
            ),
          ),
          const Spacer(),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Note: SharedPreferences requires "await" or Future callbacks for all operations as it communicates with native platform APIs.',
                style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.nelGrey),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
