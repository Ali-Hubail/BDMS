import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Reprot extends StatelessWidget {
  const Reprot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
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
      ),
    );
  }
}
