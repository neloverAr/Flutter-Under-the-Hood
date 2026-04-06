import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final int index;
  const DetailsView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo_$index',
              child: Image.asset('assets/images/logo.png', width: 200),
            ),
            const SizedBox(height: 30),
            Text(
              'Detailed Information for Item $index',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'This is a long description text that should be cleaned up later. '
                'It contains details about the item selected from the list. '
                'In a clean code architecture, this data would come from a model.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
