import 'package:bdms/common_widgets/blood_group_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/dr_rp_info_item.dart';
import 'package:bdms/data/requests_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class MgrManageScreen extends StatelessWidget {
  const MgrManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Manage',
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 1,
        managerView: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                for (final bloodGroup in BloodGroup.values)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: BloodGroupItem(
                      bloodGroup: bloodGroup,
                      onTap: () {
                        RequestsRepository().fetchRequests();
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                // Turn to a listview builder and display real items
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    name: 'Husni',
                    rowItem1: 'KFUPM',
                    rowItem2: 'Building 22 Room 128',
                    bloodGroup: BloodGroup.AB_NEGATIVE,
                    icon1: Icons.delete,
                    icon2: Icons.edit,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    name: 'Husni',
                    rowItem1: 'KFUPM',
                    rowItem2: 'Building 22 Room 128',
                    bloodGroup: BloodGroup.AB_NEGATIVE,
                    icon1: Icons.delete,
                    icon2: Icons.edit,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DrRpInfoItem(
                    name: 'Husni',
                    rowItem1: 'KFUPM',
                    rowItem2: 'Building 22 Room 128',
                    bloodGroup: BloodGroup.AB_NEGATIVE,
                    icon1: Icons.delete,
                    icon2: Icons.edit,
                    icon1OnTap: () {},
                    icon2OnTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: DrRpInfoItem(
                    name: 'Husni',
                    rowItem1: 'KFUPM',
                    rowItem2: 'Building 22 Room 128',
                    bloodGroup: BloodGroup.AB_NEGATIVE,
                    icon1: Icons.delete,
                    icon2: Icons.edit,
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
