import 'package:bdms/common_widgets/custom_app_bar.dart';
import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/data/diseases_repository.dart';
import 'package:bdms/domain/disease.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DrRpEditMedicalHistoryScreen extends StatefulWidget {
  const DrRpEditMedicalHistoryScreen({super.key});

  @override
  State<DrRpEditMedicalHistoryScreen> createState() =>
      _DrRpEditMedicalHistoryScreenState();
}

class _DrRpEditMedicalHistoryScreenState
    extends State<DrRpEditMedicalHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                  onPressed: () {
                    // Add a new disease
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String diseaseName = '';
                        return AlertDialog(
                          title: const Text('Add New Disease'),
                          content: TextField(
                            onChanged: (value) {
                              diseaseName = value;
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Disease Name"),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Add'),
                              onPressed: () {
                                setState(() {
                                  final disease = Disease(
                                      diseaseName: diseaseName,
                                      diseaseId: const Uuid().v4());
                                  DiseasesRepository().addDisease(disease);
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
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
                child: FutureBuilder(
              future: DiseasesRepository().fetchDiseases(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: AuthenticationRepository.authInstance
                        .signedInUser!.diseasesCollection.dis.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(AuthenticationRepository
                            .authInstance
                            .signedInUser
                            .diseasesCollection
                            .dis[index]
                            .diseaseName),
                        leading: const Text(
                          "\u2022 ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 9, 68, 170)),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              DiseasesRepository().deleteDisease(
                                  AuthenticationRepository
                                      .authInstance
                                      .signedInUser
                                      .diseasesCollection
                                      .dis[index]);
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(178, 198, 44, 45),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
