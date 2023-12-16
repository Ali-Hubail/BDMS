// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bdms/domain/blood_group_enum.dart';

class Request {
  final String requestId;
  final String requestType;
  final BloodGroup bloodGroup;
  final int quantity;
  final String bloodbankId;
  final bool requestStatus;
  final String sentBy;
  final DateTime requestDate;


  Request({
    required this.requestId,
    required this.requestType,
    required this.bloodGroup,
    required this.quantity,
    required this.bloodbankId,
    this.requestStatus = false,
    required this.sentBy,
    DateTime? requestDate,
 }) : requestDate = requestDate ?? DateTime.now();
}
