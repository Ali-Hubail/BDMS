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
  var isDonation = true;
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFFC62C2D).withOpacity(0.8),
                  child: Center(
                    child: Text(
                      bgMap[BloodGroup.AB_NEGATIVE]!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Make a Request',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Request Type: ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isDonation = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: isDonation
                        ? const Color(0xFFC62C2D).withOpacity(0.8)
                        : Colors.grey,
                  ),
                  child: const Text(
                    'Donation',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isDonation = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: !isDonation
                        ? const Color(0xFFC62C2D).withOpacity(0.8)
                        : Colors.grey,
                  ),
                  child: const Text(
                    'Recieve',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const Text(
                  'Amount of Blood:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: TextField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 64,
            ),
            Center(
              child: PrimaryButton(
                text: 'Send Request',
                onPressed: () {
                  // process request
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Request Sent'),
                        content: const Text(
                            'Your request has been sent successfully.'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
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
