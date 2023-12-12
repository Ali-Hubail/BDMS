import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:flutter/material.dart';

class DrRpEditPersonalInfo extends StatelessWidget {
  const DrRpEditPersonalInfo({super.key});

  // Add form handling logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            title: 'Edit Personal Information', backButton: true),
        body: Form(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PrimaryInput(hintText: 'Email'),
                  const SizedBox(
                    height: 16,
                  ),
                  const PrimaryInput(hintText: 'Address'),
                  const SizedBox(
                    height: 16,
                  ),
                  const PrimaryInput(hintText: 'Contact Number'),
                  const SizedBox(
                    height: 16,
                  ),
                  const PrimaryInput(hintText: 'Weight'),
                  const SizedBox(
                    height: 128,
                  ),
                  PrimaryButton(
                    text: 'Save',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
