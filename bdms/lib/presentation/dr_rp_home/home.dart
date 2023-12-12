import 'package:bdms/common_widgets/event_item.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DrRpHomeScreen extends StatefulWidget {
  const DrRpHomeScreen({super.key});

  @override
  State<DrRpHomeScreen> createState() => _DrRpHomeScreenState();
}

class _DrRpHomeScreenState extends State<DrRpHomeScreen> {
  bool isDonor = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 48),
              PrimaryButton(text: 'Pay', onPressed: () {}, buttonWidth: 300),
              const SizedBox(height: 96),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          isDonor = true;
                        },
                      );
                    },
                    child: Text(
                      'Donations',
                      style: TextStyle(
                        decoration: isDonor ? TextDecoration.underline : null,
                        decorationColor: const Color(0xFFC62C2D),
                        decorationThickness: 2,
                        fontSize: 24,
                        color: isDonor
                            ? const Color(0xFFC62C2D)
                            : Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isDonor = false;
                      });
                    },
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        decoration: isDonor ? null : TextDecoration.underline,
                        decorationColor: const Color(0xFFC62C2D),
                        decorationThickness: 2,
                        fontSize: 24,
                        color: isDonor
                            ? Colors.black.withOpacity(0.5)
                            : const Color(0xFFC62C2D),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  EventItem(
                      day: 7,
                      month: 'Oct',
                      title: 'Anchor University ',
                      description: 'description'),
                  const SizedBox(height: 16),
                  EventItem(
                      day: 8,
                      month: "Oct",
                      title: 'Anchor University',
                      description: 'description'),
                  const SizedBox(height: 16),
                  EventItem(
                      day: 9,
                      month: "Oct",
                      title: 'Anchor University',
                      description: 'description')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
