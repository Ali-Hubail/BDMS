import 'package:bdms/common_widgets/blood_stat_info_item.dart';
import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/data/reports_repository.dart';
import 'package:flutter/material.dart';

class MgrReports extends StatefulWidget {
  const MgrReports({super.key});

  @override
  State<MgrReports> createState() => _MgrReportsState();
}

class _MgrReportsState extends State<MgrReports> {
  var isWeekly = 'week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Reports',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Report',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isWeekly = 'week';
                      });
                    },
                    child: Text(
                      'Week',
                      style: TextStyle(
                        color: isWeekly == 'week' ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ReportsRepository().getBloodReportsByGroup();
                      setState(() {
                        isWeekly = 'month';
                      });
                    },
                    child: Text(
                      'Month',
                      style: TextStyle(
                        color: isWeekly == 'month' ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: FutureBuilder(
                  future: ReportsRepository().getBloodTotal(isWeekly),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          BloodStatInfoItem(
                            title: 'Total Blood:',
                            number: '${snapshot.data!['sum']} pints of blood',
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          BloodStatInfoItem(
                            title: 'Total Donations:',
                            number: snapshot.data!['count'].toString(),
                          )
                        ],
                      );
                    }
                    ;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
