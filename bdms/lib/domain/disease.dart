// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Disease {
  Disease({required this.diseaseName, required this.diseaseId});

  final String diseaseName;
  final String diseaseId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'diseaseName': diseaseName,
      'diseaseId': diseaseId,
    };
  }

  factory Disease.fromMap(
    Map<String, dynamic> map,
    int i,
  ) {
    return Disease(
      diseaseName: map['disease'][i]['disease_name'] as String,
      diseaseId: map['disease'][i]['disease_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Disease.fromJson(String source, int i) =>
      Disease.fromMap(json.decode(source) as Map<String, dynamic>, i);
}
