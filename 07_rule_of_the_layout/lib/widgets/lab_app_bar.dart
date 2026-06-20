import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/strings.dart';

class LabAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppStrings.appTitle),
      backgroundColor: AppColors.nelBlue,
      foregroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png', height: 40),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
