import 'package:bdms/presentation/authentication/signup_screen.dart';
import 'package:bdms/presentation/dr_rp_home/dr_rp_home.dart';
import 'package:bdms/presentation/mgr_manage/mgr_manage_dr_rp.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}
