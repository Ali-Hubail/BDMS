import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:flutter/material.dart';

class MgrManageDrRpScreen extends StatelessWidget {
  const MgrManageDrRpScreen({super.key});

  // pass user to this screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        // replace with selected recipient/donor name
        title: 'Recipient/Donor Name',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // fetch real data and display them
            const Column(
              children: [
                BloodStatInfoItem(
                  title: 'Name',
                  number: 'Husni',
                ),
                BloodStatInfoItem(
                  title: 'Blood Group',
                  number: 'AB-',
                ),
                BloodStatInfoItem(
                  title: 'Diseases',
                  number: 'السل, الملاريا',
                ),
                BloodStatInfoItem(
                  title: 'ID',
                  number: '1209479',
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              // Turn to a listview builder to display real items data
              child: ListView(
                children: [
                  EventItem(
                      day: 7,
                      month: 'Oct',
                      title: 'Anchor',
                      description: 'One Pint of blood',
                      states: 'Donation'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
