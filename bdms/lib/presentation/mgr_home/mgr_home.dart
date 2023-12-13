import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/dr_rp_info_item.dart';
import 'package:bdms/domain/blood_group.dart';
import 'package:flutter/material.dart';

class MgrHomeScreen extends StatelessWidget {
  const MgrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 0,
        managerView: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recieving Requests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
                // Turn to listview builder to display real items
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    bloodGroup: BloodGroup.A_NEGATIVE,
                    name: 'Husni',
                    rowItem1: 'Date: 12/12/2021',
                    rowItem2: 'Amount: 2 pints',
                    icon1: Icons.check,
                    icon2: Icons.delete,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    bloodGroup: BloodGroup.A_NEGATIVE,
                    name: 'Husni',
                    rowItem1: 'Date: 12/12/2021',
                    rowItem2: 'Amount: 2 pints',
                    icon1: Icons.check,
                    icon2: Icons.delete,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    bloodGroup: BloodGroup.A_NEGATIVE,
                    name: 'Husni',
                    rowItem1: 'Date: 12/12/2021',
                    rowItem2: 'Amount: 2 pints',
                    icon1: Icons.check,
                    icon2: Icons.delete,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
