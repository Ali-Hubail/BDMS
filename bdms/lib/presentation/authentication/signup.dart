import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(48, 20, 48, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/bdms.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 80),
              Align(
                alignment: AlignmentGeometry.lerp(
                    Alignment.topLeft, Alignment.centerLeft, 0.2)!,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC62C2D),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: AlignmentGeometry.lerp(
                    Alignment.topLeft, Alignment.centerLeft, 0.2)!,
                child: const Text(
                  'Please register below',
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 32),
              const PrimaryInput(hintText: 'Name'),
              const SizedBox(height: 16),
              const PrimaryInput(hintText: 'Email'),
              const SizedBox(height: 16),
              const PrimaryInput(hintText: 'Password'),
              const SizedBox(height: 32),
              PrimaryButton(
                  text: 'Sign Up', onPressed: () {}, buttonWidth: 350),
              const SizedBox(height: 15),
              const InkWell(
                onTap: null,
                child: Text(
                  'Continue as Guest',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFC62C2D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
