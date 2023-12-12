import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/presentation/dr_rp_home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'Home',
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: DrRpHomeScreen(),
      ),
    );
  }
}
