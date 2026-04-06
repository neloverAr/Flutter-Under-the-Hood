import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () => Get.offAllNamed('/login'), // Simple way to logout
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset('assets/images/logo.png', width: 50),
              title: Text('Item Number $index'),
              subtitle: const Text('This is a simple description for the item'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.to(() => DetailsView(index: index));
              },
            ),
          );
        },
      ),
    );
  }
}
