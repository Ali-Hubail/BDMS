import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class MgrManageDrRpScreen extends StatelessWidget {
  const MgrManageDrRpScreen({super.key});

  // pass user to this screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
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
            Row(
              children: [
                PrimaryButton(
                  text: 'Donation',
                  buttonWidth: 172,
                  buttonHeight: 48,
                  // open a dialog to complete the process
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Donation',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // add real data
                              const BloodStatInfoItem(
                                title: 'Blood Group:',
                                number: '0',
                              ),
                              const BloodStatInfoItem(
                                title: 'Amount:',
                                number: '0',
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              PrimaryButton(
                                text: 'Confirm',
                                buttonWidth: 172,
                                buttonHeight: 48,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const Spacer(),
                PrimaryButton(
                  text: 'Recieve',
                  buttonHeight: 48,
                  buttonWidth: 172,
                  // open a dialog to complete the process
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Recieve',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // add real data
                              const BloodStatInfoItem(
                                title: 'Blood Group:',
                                number: '0',
                              ),
                              const BloodStatInfoItem(
                                title: 'Amount Needed:',
                                number: '0',
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              PrimaryButton(
                                text: 'Confirm',
                                buttonWidth: 172,
                                buttonHeight: 48,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
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
