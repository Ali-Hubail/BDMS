import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/data/requests_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/domain/person.dart';
import 'package:bdms/domain/request.dart';
import 'package:bdms/presentation/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DrRpHomeScreen extends StatefulWidget {
  const DrRpHomeScreen({super.key});

  @override
  State<DrRpHomeScreen> createState() => _DrRpHomeScreenState();
}

class _DrRpHomeScreenState extends State<DrRpHomeScreen> {
  var isDonation = true;
  final _amountEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _amountEditingController.dispose();
  }

  Future<bool> sendRequest() {
    final Person user = AuthenticationRepository.authInstance.signedInUser;
    final String requestId = const Uuid().v4();
    final DateTime requestDate = DateTime.now();
    final String requestType = isDonation ? 'donation' : 'receiving';
    final BloodGroup bloodGroup = user.bloodGroup;
    if (_amountEditingController.text.isEmpty ||
        _amountEditingController.text
            .contains('abcdefghijklmnopqrstuvwxyz,..+-*/@!@&)%@^&!/|()=')) {
      return Future.value(false);
    }
    final int quantity = int.parse(_amountEditingController.text);
    final String sentBy = user.id;

    final Request request = Request(
      requestId: requestId,
      requestDate: requestDate,
      requestType: requestType,
      bloodGroup: bloodGroup,
      quantity: quantity,
      sentBy: sentBy,
    );

    return RequestsRepository().sendRequest(request);
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
                      bgToString[BloodGroup.AB_NEGATIVE]!,
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
                        controller: _amountEditingController,
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
                onPressed: () async {
                  if (AuthenticationRepository().signedInUser == null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  }
                  // process request
                  final success = await sendRequest();
                  if (success) {
                    if (context.mounted) {
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
                    }
                  } else {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('There was an error'),
                            content: const Text(
                                'Please check that you have entered a valid amount.'),
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
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
