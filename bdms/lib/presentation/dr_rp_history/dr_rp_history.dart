import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/data/requests_repository.dart';
import 'package:bdms/domain/person.dart';
import 'package:bdms/utils/months_mapping.dart';
import 'package:flutter/material.dart';

class DrRpHistoryScreen extends StatefulWidget {
  const DrRpHistoryScreen({super.key});

  @override
  State<DrRpHistoryScreen> createState() => _DrRpHistoryScreenState();
}

class _DrRpHistoryScreenState extends State<DrRpHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "History"),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                'History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: FutureBuilder(
                future: RequestsRepository().getDrRpHistoryApproved(
                    AuthenticationRepository.authInstance.signedInUser),
                builder: (context, snapshot) {
                  final Person user =
                      AuthenticationRepository.authInstance.signedInUser;

                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: user.requestsCollection.reqs.length,
                      itemBuilder: (context, index) => EventItem(
                        day:
                            user.requestsCollection.reqs[index].requestDate.day,
                        month: numberToMonth[user
                            .requestsCollection.reqs[index].requestDate.month],
                        title: 'KFUPM University Hospital',
                        description:
                            '${user.requestsCollection.reqs[index].quantity} pints of blood',
                        states: user.requestsCollection.reqs[index].requestType,
                      ),
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
