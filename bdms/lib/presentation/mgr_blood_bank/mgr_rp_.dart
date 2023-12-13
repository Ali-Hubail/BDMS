import 'package:bdms/common_widgets/blood_info.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:flutter/material.dart';

class MgrReport extends StatefulWidget {
  const MgrReport({super.key});

  @override
  State<MgrReport> createState() => _MgrReportState();
}

class _MgrReportState extends State<MgrReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Reports',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Report',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  PrimaryButton(
                      text: 'Month/Week', onPressed: () {}, buttonWidth: 180),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 's', label: 'label')
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const BloodInfo(title: 'Total Blood', number: '25L'),
            const BloodInfo(title: 'Blood Type Total:', number: '25L'),
            const BloodInfo(title: 'Total Donations:', number: '25L'),
            const BloodInfo(title: 'Payments:', number: '500'),
          ],
        ),
      ),
    );
  }
}
