import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class MgrReportsScreen extends StatelessWidget {
  const MgrReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Reports'),
        bottomNavigationBar: const CustomBottomNavigationBar(
          index: 2,
          managerView: true,
        ),
        body: Center(
          child: Column(
            children: [
              PrimaryButton(
                text: "Show Blood Bank",
                onPressed: () {},
                buttonHeight: 64,
                buttonWidth: 300,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: "Show Reports",
                onPressed: () {},
                buttonHeight: 64,
                buttonWidth: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
