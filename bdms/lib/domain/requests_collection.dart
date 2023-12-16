// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bdms/domain/request.dart';

class RequestsCollection {
  RequestsCollection({
    required this.requests,
  });

  final List<Request> requests;

  List<Request> get reqs => requests;

  void addRequest(Request req) {
    requests.add(req);
  }

  void removeRequest(Request req) {
    requests.remove(req);
  }
}
