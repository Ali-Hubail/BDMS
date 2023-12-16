import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/presentation/authentication/login_screen.dart';
import 'package:bdms/presentation/dr_rp_home/dr_rp_home.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _dropDownMenuController = TextEditingController();
  final _nameEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _ageEditingController = TextEditingController();
  final _contactNumberEditingController = TextEditingController();
  final _weightEditingController = TextEditingController();

  final authRepository = AuthenticationRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dropDownMenuController.dispose();
    _nameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _addressEditingController.dispose();
    _ageEditingController.dispose();
    _contactNumberEditingController.dispose();
    _weightEditingController.dispose();
  }

  Future<bool> signUp() async {
    String email = _emailEditingController.text;
    String password = _passwordEditingController.text;
    String name = _nameEditingController.text;
    String address = _addressEditingController.text;
    String contactNumber = _contactNumberEditingController.text;
    String bloodGroup = _dropDownMenuController.text;
    String age = _ageEditingController.text;
    String? weight = _weightEditingController.text;
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        address.isEmpty ||
        contactNumber.isEmpty ||
        bloodGroup.isEmpty ||
        // age == null ||
        // age <= 0 ||
        // weight == null ||
        // weight <= 20 ||
        !email.contains('@') ||
        password.length < 6) {
      return false;
    }

    final res = await authRepository.signUp(
      email,
      password,
      age,
      weight,
      contactNumber,
      address,
      bloodGroup,
      name,
    );
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Center(
                child: Image.asset(
                  'assets/bdms.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 300,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: (1 / .25),
                  ),
                  children: [
                    PrimaryInput(
                      hintText: 'Name',
                      controller: _nameEditingController,
                    ),
                    PrimaryInput(
                      hintText: 'Email',
                      controller: _emailEditingController,
                    ),
                    PrimaryInput(
                      hintText: 'Password',
                      controller: _passwordEditingController,
                      obscuredText: true,
                    ),
                    PrimaryInput(
                      hintText: 'Address',
                      controller: _addressEditingController,
                    ),
                    PrimaryInput(
                      hintText: 'Age',
                      controller: _ageEditingController,
                    ),
                    PrimaryInput(
                      hintText: 'Contact Number',
                      controller: _contactNumberEditingController,
                    ),
                    PrimaryInput(
                      hintText: 'Weight',
                      controller: _weightEditingController,
                    ),
                    DropdownMenu<BloodGroup>(
                      controller: _dropDownMenuController,
                      dropdownMenuEntries: [
                        for (var bloodgroup in BloodGroup.values)
                          DropdownMenuEntry<BloodGroup>(
                            value: bloodgroup,
                            label: bgToString[bloodgroup]!,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 128,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: PrimaryButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    final success = await signUp();
                    if (success) {
                      if (context.mounted) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      }
                    }
                  },
                  buttonWidth: double.infinity,
                ),
              ),
              const Center(
                child: Text(
                  'Continue as Guest',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFC62C2D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
