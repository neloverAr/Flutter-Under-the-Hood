// import 'package:flutter/material.dart';
// import '../core/constants/colors.dart';
// import '../core/constants/strings.dart';
//
// class StatefulBox extends StatefulWidget {
//   final String text;
//   final Color color;
//
//   const StatefulBox({
//     super.key,
//     required this.text,
//     required this.color,
//   });
//
//   @override
//   State<StatefulBox> createState() => _StatefulBoxState();
// }
//
// class _StatefulBoxState extends State<StatefulBox> {
//   late Color _internalColor;
//
//   @override
//   void initState() {
//     super.initState();
//     // تثبيت اللون الداخلي بناءً على النص ليكون الاختبار دقيقاً ومستقراً
//     // Widget A ستحصل دائماً على Cyan، و Widget B ستحصل على Grey عند أول بناء
//     if (widget.text.contains('A')) {
//       _internalColor = AppColors.nelCyan;
//     } else {
//       _internalColor = AppColors.nelGrey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 150,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: widget.color, // اللون القادم من الـ Widget (Blue / Yellow)
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             widget.text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             AppStrings.stateLostLabel,
//             style: TextStyle(color: Colors.white70, fontSize: 10),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           Container(
//             width: 35,
//             height: 35,
//             decoration: BoxDecoration(
//               color: _internalColor, // هذه هي الـ State التي نريد مراقبتها
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 2.5),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
