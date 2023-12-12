import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DrRpHistoryScreen extends StatelessWidget {
  const DrRpHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "History"),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'History',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  PrimaryButton(text: 'Choose Date', onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  EventItem(
                    day: 7,
                    month: 'Oct',
                    title: 'Anchor University ',
                    description: 'description',
                    states: 'Donation',
                  ),
                  const SizedBox(height: 16),
                  EventItem(
                    day: 8,
                    month: "Oct",
                    title: 'Anchor University',
                    description: 'description',
                    states: 'Recieved',
                  ),
                  const SizedBox(height: 16),
                  EventItem(
                    day: 9,
                    month: "Oct",
                    title: 'Anchor University',
                    description: 'description',
                    states: 'Paid',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
