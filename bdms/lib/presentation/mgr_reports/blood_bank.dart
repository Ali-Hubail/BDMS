import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/date_picker.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class MgrBloodBankScreen extends StatefulWidget {
  const MgrBloodBankScreen({super.key});

  @override
  State<MgrBloodBankScreen> createState() => _MgrBloodBankScreenState();
}

class _MgrBloodBankScreenState extends State<MgrBloodBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Blood Bank', backButton: true),
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
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Blood Collected',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                DatePicker(
                  hintText: 'Date',
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  BloodStatInfoItem(
                    title: 'Total Blood Available',
                    number: '0',
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
