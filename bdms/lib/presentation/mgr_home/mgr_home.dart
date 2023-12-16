import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/dr_rp_info_item.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/data/requests_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:flutter/material.dart';

class MgrHomeScreen extends StatefulWidget {
  const MgrHomeScreen({super.key});

  @override
  State<MgrHomeScreen> createState() => _MgrHomeScreenState();
}

class _MgrHomeScreenState extends State<MgrHomeScreen> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              // Turn to listview builder to display real items
              child: FutureBuilder(
                  future: RequestsRepository().fetchRequests(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: AuthenticationRepository.authInstance
                            .signedInUser.requestsCollection.reqs.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: DrRpInfoItem(
                            bloodGroup: BloodGroup.A_NEGATIVE,
                            name: AuthenticationRepository
                                .authInstance
                                .signedInUser
                                .requestsCollection
                                .reqs[index]
                                .requestType,
                            rowItem1: AuthenticationRepository
                                .authInstance
                                .signedInUser
                                .requestsCollection
                                .reqs[index]
                                .requestDate
                                .toString()
                                .substring(0, 11),
                            rowItem2:
                                '${AuthenticationRepository.authInstance.signedInUser.requestsCollection.reqs[index].quantity} pints',
                            icon1: Icons.check,
                            icon2: Icons.delete,
                            icon1OnTap: () {
                              setState(() {
                                RequestsRepository().approveRequest(
                                    AuthenticationRepository
                                        .authInstance
                                        .signedInUser
                                        .requestsCollection
                                        .reqs[index]);
                              });
                            },
                            icon2OnTap: () {
                              setState(() {
                                RequestsRepository().rejectRequest(
                                    AuthenticationRepository
                                        .authInstance
                                        .signedInUser
                                        .requestsCollection
                                        .reqs[index]);
                              });
                            },
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
        ]),
      ),
    );
  }
}
