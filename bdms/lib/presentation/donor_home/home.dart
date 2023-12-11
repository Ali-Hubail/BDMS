import 'package:bdms/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDonor = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            PrimaryButton(text: 'Pay', onPressed: () {}, buttonWidth: 300),
            const SizedBox(height: 256),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isDonor = true;
                    });
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
            )
          ],
        ),
      ),
    ));
  }
}
