import 'package:bdms/common_widgets/blood_type.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/date_picker.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BloodBank extends StatefulWidget {
  const BloodBank({super.key});

  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Blood Bank'),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Initiate Blood Collection Drive',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DatePicker(
                  hintText: 'Start Date',
                ),
                DatePicker(
                  hintText: 'End Date',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(text: 'Generate', onPressed: () {}, buttonWidth: 150),
            const SizedBox(
              height: 32,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Blood Collected',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                DatePicker(
                  hintText: 'Date',
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  BloodType(
                    bloodType: 'Total Blood Available',
                  ),
                  // Add rest of statistics
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
