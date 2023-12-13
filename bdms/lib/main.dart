import 'package:bdms/presentation/mgr_reports/mgr_reports.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MgrReportsScreen(),
    );
  }
}
