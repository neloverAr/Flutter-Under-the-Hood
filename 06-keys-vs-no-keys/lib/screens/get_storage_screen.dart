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

  @override
  void initState() {
    super.initState();
    _readData();
  }

  void _saveData() {
    if (_controller.text.isNotEmpty) {
      // GetStorage is Synchronous
      _box.write(AppStrings.storageKey, _controller.text);
      _readData();
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved with GetStorage (Sync)')),
      );
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
              color: AppColors.nelCyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.nelCyan),
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
                'Benefit: GetStorage handles data synchronously, so you don\'t need "await" for simple read/write operations.',
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
