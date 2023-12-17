import 'package:bdms/common_widgets/blood_group_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/dr_rp_info_item.dart';
import 'package:bdms/data/people_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/presentation/mgr_manage/mgr_manage_dr_rp.dart';
import 'package:flutter/material.dart';

class MgrManageScreen extends StatefulWidget {
  const MgrManageScreen({super.key});

  @override
  State<MgrManageScreen> createState() => _MgrManageScreenState();
}

class _MgrManageScreenState extends State<MgrManageScreen> {
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
                      onTap: () {},
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              // Turn to a listview builder and display real items
              child: FutureBuilder(
                future: PeopleRepository().fetchPeople(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrRpInfoItem(
                            name: snapshot.data![index].name,
                            rowItem1: snapshot.data![index].address,
                            rowItem2: snapshot.data![index].email,
                            bloodGroup: snapshot.data![index].bloodGroup,
                            icon1: Icons.delete,
                            icon2: Icons.edit,
                            icon1OnTap: () async {
                              setState(() {
                                PeopleRepository()
                                    .deletePerson(snapshot.data![index]);
                              });
                            },
                            icon2OnTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MgrManageDrRpScreen(
                                    person: snapshot.data![index]),
                              ));
                            },
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
