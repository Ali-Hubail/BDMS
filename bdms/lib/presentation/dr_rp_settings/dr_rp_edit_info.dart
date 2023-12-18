import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/common_widgets/primary_button.dart';
import 'package:bdms/common_widgets/primary_input.dart';
import 'package:bdms/data/people_repository.dart';
import 'package:bdms/domain/person.dart';
import 'package:flutter/material.dart';

class DrRpEditPersonalInfo extends StatefulWidget {
  const DrRpEditPersonalInfo({super.key, required this.user});

  // Add form handling logic
  final Person user;

  @override
  State<DrRpEditPersonalInfo> createState() => _DrRpEditPersonalInfoState();
}

class _DrRpEditPersonalInfoState extends State<DrRpEditPersonalInfo> {
  final _emailEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _contactNumberEditingController = TextEditingController();
  final _weightEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _addressEditingController.dispose();
    _contactNumberEditingController.dispose();
    _weightEditingController.dispose();
  }

  Future<bool> save() async {
    return PeopleRepository().updatePerson(
        widget.user,
        _emailEditingController.text,
        _weightEditingController.text,
        _contactNumberEditingController.text,
        _addressEditingController.text);
  }

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
                  PrimaryInput(
                    hintText: 'Email',
                    controller: _emailEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryInput(
                    hintText: 'Address',
                    controller: _addressEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryInput(
                    hintText: 'Contact Number',
                    controller: _contactNumberEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryInput(
                    hintText: 'Weight',
                    controller: _weightEditingController,
                  ),
                  const SizedBox(
                    height: 128,
                  ),
                  PrimaryButton(
                    text: 'Save',
                    onPressed: () async {
                      final success = await save();
                      if (success) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
