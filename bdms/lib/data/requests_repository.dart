import 'dart:convert';

import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/domain/person.dart';
import 'package:bdms/domain/request.dart';
import 'package:http/http.dart' as http;

class RequestsRepository {
  Future<void> getDrRpHistory() async {
    final Person drRp = AuthenticationRepository.authInstance.signedInUser;
    final String id = drRp.id;
    final res =
        await http.get(Uri.parse('http://10.0.2.2:8080/person/history/$id'));

    if (res.statusCode == 200) {
      final decodedRes = jsonDecode(res.body);
      final requestsList = decodedRes['request'];
      if (requestsList.isEmpty) {
        return;
      }
      drRp.requestsCollection.reqs.clear();

      for (int i = 0; i < requestsList.length; i++) {
        final Request request = Request.fromJson(res.body, i);
        drRp.requestsCollection.addRequest(request);
      }
    }
  }
}
