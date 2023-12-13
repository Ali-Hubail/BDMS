import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/presentation/mgr_reports/blood_bank.dart';
import 'package:bdms/presentation/mgr_reports/mgr_rp_.dart';
import 'package:flutter/material.dart';

class MgrReportsScreen extends StatelessWidget {
  const MgrReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reports'),
      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 2,
        managerView: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            children: [
              PrimaryButton(
                text: 'Show Blood Bank',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MgrBloodBankScreen(),
                  ));
                },
                buttonHeight: 64,
                buttonWidth: 300,
              ),
              const SizedBox(height: 48),
              PrimaryButton(
                text: 'Show Reports',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MgrReports(),
                  ));
                },
                buttonHeight: 64,
                buttonWidth: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
