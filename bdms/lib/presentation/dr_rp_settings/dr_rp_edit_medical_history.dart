import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DrRpEditMedicalHistoryScreen extends StatelessWidget {
  const DrRpEditMedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Medical History',
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Diseases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 32,
                    color: Colors.black,
                    weight: 5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              // Turn to a listview builder to display the list of diseases
              child: ListView(
                children: const [
                  DiseaseItem(
                    diseaseName: 'Disease 1',
                  ),
                  DiseaseItem(
                    diseaseName: 'Disease 2',
                  ),
                  DiseaseItem(
                    diseaseName: 'Disease 3',
                  ),
                  DiseaseItem(
                    diseaseName: 'Disease 4',
                  ),
                  DiseaseItem(
                    diseaseName: 'Disease 5',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiseaseItem extends StatelessWidget {
  const DiseaseItem({super.key, required this.diseaseName});

  final String diseaseName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(diseaseName),
      leading: const Text(
        "\u2022 ",
        style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 9, 68, 170)),
      ),
      trailing: const Icon(
        Icons.delete,
        color: Color.fromARGB(178, 198, 44, 45),
      ),
    );
  }
}
