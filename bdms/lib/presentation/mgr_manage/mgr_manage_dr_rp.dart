import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/data/requests_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/domain/person.dart';
import 'package:bdms/presentation/dr_rp_settings/dr_rp_edit_info.dart';
import 'package:bdms/utils/months_mapping.dart';
import 'package:flutter/material.dart';

class MgrManageDrRpScreen extends StatelessWidget {
  const MgrManageDrRpScreen({super.key, required this.person});

  final Person person;
  // pass user to this screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // replace with selected recipient/donor name
        title: person.name,
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
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DrRpEditPersonalInfo(user: person),
                    ));
                  },
                  child: BloodStatInfoItem(
                    title: 'Name',
                    number: person.name,
                  ),
                ),
                BloodStatInfoItem(
                  title: 'Blood Group',
                  number: bgToString[person.bloodGroup],
                ),
                BloodStatInfoItem(
                  title: 'Age',
                  number: person.age.toString(),
                ),
                BloodStatInfoItem(
                  title: 'Weight',
                  number: person.weight.toString(),
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
              child: FutureBuilder(
                future: RequestsRepository().getDrRpHistoryApproved(person),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: person.requestsCollection.reqs.length,
                      itemBuilder: (context, index) {
                        return EventItem(
                          day: person
                              .requestsCollection.reqs[index].requestDate.day,
                          month: numberToMonth[person.requestsCollection
                              .reqs[index].requestDate.month],
                          title: 'KFUPM University Hospital',
                          description:
                              '${person.requestsCollection.reqs[index].quantity} pints of blood',
                          states:
                              person.requestsCollection.reqs[index].requestType,
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
