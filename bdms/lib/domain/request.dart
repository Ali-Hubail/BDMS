// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'requestId': requestId,
      'requestType': requestType,
      'bloodGroup': bloodGroup,
      'quantity': quantity,
      'bloodbankId': bloodbankId,
      'requestStatus': requestStatus,
      'sentBy': sentBy,
      'requestDate': requestDate.millisecondsSinceEpoch,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map, i) {
    return Request(
      requestId: (map['request'][i]['request_id'] ?? '') as String,
      requestType: (map['request'][i]['request_type'] ?? '') as String,
      bloodGroup: sTringToBg[map['request'][i]['blood_group']] as BloodGroup,
      quantity: (map['request'][i]['quantity']) as int,
      bloodbankId: (map['request'][i]['blood_bank_id'] ?? '') as String,
      requestStatus: (map['request'][i]['request_status'] ?? false) as bool,
      sentBy: (map['request'][i]['sent_by'] ?? '') as String,
      requestDate: DateTime.parse((map['request'][i]['request_date'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source, i) =>
      Request.fromMap(json.decode(source) as Map<String, dynamic>, i);
}
