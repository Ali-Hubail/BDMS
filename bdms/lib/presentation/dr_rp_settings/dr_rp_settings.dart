import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/presentation/dr_rp_settings/dr_rp_edit_info.dart';
import 'package:flutter/material.dart';

class DrRpSettingsScreen extends StatelessWidget {
  const DrRpSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 3),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 64.0,
          vertical: 48,
        ),
        child: Column(
          children: [
            PrimaryButton(
              buttonWidth: 300,
              buttonHeight: 50,
              text: 'Edit Personal Information',
              // Navigate to edit personal information page
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DrRpEditPersonalInfo(),
                ));
              },
            ),
            const SizedBox(
              height: 64.0,
            ),
            PrimaryButton(
              buttonWidth: 300,
              buttonHeight: 50,
              text: 'Edit Medical History',
              // Navigate to edit medical history
              onPressed: () {},
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                // Logout the user
                onPressed: () {},
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Color.fromARGB(255, 244, 75, 75),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
