import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/dr_rp_info_item.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class DrRpHomeScreen extends StatefulWidget {
  const DrRpHomeScreen({super.key});

  @override
  State<DrRpHomeScreen> createState() => _DrRpHomeScreenState();
}

class _DrRpHomeScreenState extends State<DrRpHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            PrimaryButton(
              text: 'Pay',
              onPressed: () {},
              buttonWidth: 500,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFC62C2D).withOpacity(0.5),
                child: Text(bgMap[BloodGroup.AB_NEGATIVE]!),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Requests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView(
                children: [
                  DrRpInfoItem(
                    name: 'Husni',
                    rowItem1: 'Date:',
                    rowItem2: 'Amount:',
                    bloodGroup: BloodGroup.AB_NEGATIVE,
                    icon1: Icons.check,
                    icon2: Icons.delete,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
