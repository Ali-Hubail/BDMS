import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/presentation/authentication/signup_screen.dart';
import 'package:bdms/presentation/dr_rp_home/dr_rp_home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final authRepoistory = AuthenticationRepository();

  Future<bool> login() async {
    String email = _emailEditingController.text;
    String password = _passwordEditingController.text;
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    final success = await authRepoistory.signIn(email, password);
    return success;
  }

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48, 20, 48, 0),
        child: Center(
          child: SingleChildScrollView(
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
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC62C2D),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 64),
                PrimaryInput(
                  hintText: 'Email',
                  controller: _emailEditingController,
                ),
                const SizedBox(height: 16),
                PrimaryInput(
                  hintText: 'Password',
                  controller: _passwordEditingController,
                ),
                const SizedBox(height: 96),
                PrimaryButton(
                    text: 'Login',
                    onPressed: () async {
                      final res = await login();
                      if (res) {
                        print(authRepoistory.signedInUser!.id);

                        if (context.mounted) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DrRpHomeScreen(),
                          ));
                        }
                      }
                    },
                    buttonWidth: 350),
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
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                      },
                      child: const Text(
                        'Sign Up',
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
      ),
    );
  }
}
