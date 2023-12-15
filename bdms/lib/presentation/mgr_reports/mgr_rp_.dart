import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class MgrReports extends StatefulWidget {
  const MgrReports({super.key});

  @override
  State<MgrReports> createState() => _MgrReportsState();
}

class _MgrReportsState extends State<MgrReports> {
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
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: DropdownMenu<BloodGroup>(
                dropdownMenuEntries: [
                  for (final bloodgroup in BloodGroup.values)
                    DropdownMenuEntry(
                        value: bloodgroup, label: bgToString[bloodgroup]!),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const BloodStatInfoItem(title: 'Total Blood', number: '25L'),
            const BloodStatInfoItem(title: 'Blood Type Total:', number: '25L'),
            const BloodStatInfoItem(title: 'Total Donations:', number: '25L'),
            const BloodStatInfoItem(title: 'Payments:', number: '500'),
          ],
        ),
      ),
    );
  }
}
