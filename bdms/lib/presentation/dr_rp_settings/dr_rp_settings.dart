import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/presentation/authentication/login_screen.dart';
import 'package:bdms/presentation/dr_rp_settings/dr_rp_edit_info.dart';
import 'package:bdms/presentation/dr_rp_settings/dr_rp_edit_medical_history.dart';
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
                if (AuthenticationRepository.authInstance.user == null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                  return;
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DrRpEditPersonalInfo(
                    user: AuthenticationRepository.authInstance.signedInUser,
                  ),
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

              onPressed: () {
                if (AuthenticationRepository.authInstance.user == null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                  return;
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DrRpEditMedicalHistoryScreen(),
                ));
              },
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                // Logout the user
                onPressed: () {
                  AuthenticationRepository.authInstance.user = null;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
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
