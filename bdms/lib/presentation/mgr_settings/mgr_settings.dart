import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/presentation/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class MgrSettingsScreen extends StatelessWidget {
  const MgrSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      bottomNavigationBar:
          const CustomBottomNavigationBar(index: 3, managerView: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
    );
  }
}
