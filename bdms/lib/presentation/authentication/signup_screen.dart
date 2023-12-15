import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _dropDownMenuController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dropDownMenuController.dispose();
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
                    const PrimaryInput(hintText: 'Name'),
                    const PrimaryInput(hintText: 'Email'),
                    const PrimaryInput(hintText: 'Password'),
                    const PrimaryInput(hintText: 'Address'),
                    const PrimaryInput(hintText: 'Age'),
                    const PrimaryInput(hintText: 'Contact Number'),
                    const PrimaryInput(hintText: 'Weight'),
                    DropdownMenu<BloodGroup>(
                      controller: _dropDownMenuController,
                      dropdownMenuEntries: [
                        for (var bloodgroup in BloodGroup.values)
                          DropdownMenuEntry<BloodGroup>(
                            value: bloodgroup,
                            label: bgMap[bloodgroup]!,
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
                  onPressed: () {},
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
                    onPressed: () {},
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
