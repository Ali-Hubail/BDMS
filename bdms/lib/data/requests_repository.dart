import 'dart:convert';

import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
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

  Future<bool> sendRequest(Request request) async {
    final res =
        await http.post(Uri.parse('http://10.0.2.2:8080/person/send'), body: {
      'request_id': request.requestId,
      'request_date': request.requestDate.toString(),
      'request_status': request.requestStatus.toString(),
      'request_type': request.requestType,
      'blood_group': bgToString[request.bloodGroup],
      'quantity': request.quantity.toString(),
      'sent_by': request.sentBy,
    });
    print(res.statusCode);
    return res.statusCode == 200;
  }
}
