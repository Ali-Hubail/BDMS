import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ]; // Add more blood types as needed

  @override
  Widget build(BuildContext context) {
    BloodGroup? selectedBloodType;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/bdms.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: (1 / .25),
                children: const [
                  PrimaryInput(hintText: 'Name'),
                  PrimaryInput(hintText: 'Email'),
                  PrimaryInput(hintText: 'Password'),
                  PrimaryInput(hintText: 'Address'),
                  PrimaryInput(hintText: 'Age'),
                  PrimaryInput(hintText: 'Contact Number'),
                ],
              ),
            ),
            DropdownButton<BloodGroup>(
                hint: const Text('Select Blood Type'),
                value: selectedBloodType,
                onChanged: (BloodGroup? newValue) {
                  selectedBloodType = newValue;
                },
                items: [
                  for (var bloodgroup in BloodGroup.values)
                    DropdownMenuItem<BloodGroup>(
                      value: bloodgroup,
                      child: Text(bloodgroup.toString()),
                    ),
                ]),
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
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
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
            ),
          ],
        ),
      ),
    );
  }
}
