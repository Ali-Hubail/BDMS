import 'dart:convert';

import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/domain/disease.dart';
import 'package:bdms/domain/person.dart';
import 'package:http/http.dart' as http;

class DiseasesRepository {
  Future<void> fetchDiseases() async {
    final Person drRp = AuthenticationRepository.authInstance.signedInUser;
    final id = drRp.id;
    final res =
        await http.get(Uri.parse('http://10.0.2.2:8080/person/disease/$id'));

    if (res.statusCode == 200) {
      drRp.diseasesCollection.dis.clear();
      final diseasesRes = jsonDecode(res.body);
      final diseaseList = diseasesRes['disease'];
      for (int i = 0; i < diseaseList.length; i++) {
        final disease = Disease.fromJson(res.body, i);
        drRp.diseasesCollection.addDisease(disease);
      }
    }
  }

  Future<void> addDisease(Disease disease) async {
    final Person drRp = AuthenticationRepository.authInstance.signedInUser;
    final id = drRp.id;
    final res = await http.post(
      Uri.parse('http://10.0.2.2:8080/person/disease/$id'),
      body: {
        'disease_name': disease.diseaseName,
        'person_id': drRp.id,
      },
    );

    if (res.statusCode == 200) {
      fetchDiseases();
    }
  }

  Future<void> deleteDisease(Disease disease) async {
    final res = await http.delete(
      Uri.parse('http://10.0.2.2:8080/person/disease/${disease.diseaseId}'),
    );

    if (res.statusCode == 200) {
      fetchDiseases();
    }
  }
}
