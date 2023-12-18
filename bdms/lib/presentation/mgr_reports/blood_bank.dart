import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/data/reports_repository.dart';
import 'package:flutter/material.dart';

class MgrBloodBankScreen extends StatefulWidget {
  const MgrBloodBankScreen({super.key});

  @override
  State<MgrBloodBankScreen> createState() => _MgrBloodBankScreenState();
}

class _MgrBloodBankScreenState extends State<MgrBloodBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Blood Bank', backButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Blood Collection Drive',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: FutureBuilder(
                future: ReportsRepository().getBloodReportsByGroup(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return BloodStatInfoItem(
                          title:
                              snapshot.data![index]['blood_group'] + ' Total',
                          number: '${snapshot.data![index]['sum']} pints',
                          secondTitle:
                              '${snapshot.data![index]['count']} donations',
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
