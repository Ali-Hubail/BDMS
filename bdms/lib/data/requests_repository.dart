import 'dart:convert';

import 'package:bdms/data/authentication_repository.dart';
import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/domain/person.dart';
import 'package:bdms/domain/request.dart';
import 'package:http/http.dart' as http;

class RequestsRepository {
  Future<void> getDrRpHistoryApproved(Person user) async {
    final res = await http
        .get(Uri.parse('http://10.0.2.2:8080/person/history/${user.id}'));

    if (res.statusCode == 200) {
      final decodedRes = jsonDecode(res.body);
      final requestsList = decodedRes['request'];
      if (requestsList.isEmpty) {
        return;
      }
      user.requestsCollection.reqs.clear();

      for (int i = 0; i < requestsList.length; i++) {
        final Request request = Request.fromJson(res.body, i);
        user.requestsCollection.addRequest(request);
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
    return res.statusCode == 200;
  }

  Future<bool> fetchRequests() async {
    final res = await http.get(Uri.parse('http://10.0.2.2:8080/request/'));
    final List<dynamic> decodedRes = jsonDecode(res.body);
    List<Request> requests =
        decodedRes.map((jsonItem) => Request.fromJsonn(jsonItem)).toList();

    final Person drRp = AuthenticationRepository.authInstance.signedInUser;
    drRp.requestsCollection.reqs.clear();
    for (int i = 0; i < requests.length; i++) {
      drRp.requestsCollection.addRequest(requests[i]);
    }

    return res.statusCode == 200;
  }

  Future<bool> approveRequest(Request request) async {
    final res = await http
        .patch(Uri.parse('http://10.0.2.2:8080/request/${request.requestId}'));

    return res.statusCode == 200;
  }

  Future<bool> rejectRequest(Request request) async {
    final res = await http
        .delete(Uri.parse('http://10.0.2.2:8080/request/${request.requestId}'));

    return res.statusCode == 200;
  }
}
