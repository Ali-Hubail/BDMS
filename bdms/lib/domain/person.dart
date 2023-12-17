// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bdms/domain/blood_group_enum.dart';
import 'package:bdms/domain/diseases_collection.dart';
import 'package:bdms/domain/requests_collection.dart';

class Person {
  Person({
    required this.id,
    required this.email,
    required this.contactNumber,
    required this.role,
    required this.bloodGroup,
    required this.address,
    required this.weight,
    required this.age,
    required this.name,
  });

  final String id;
  final String name;
  final String email;
  final String contactNumber;
  final String role;
  final BloodGroup bloodGroup;
  final String address;
  final double weight;
  final int age;
  final DiseasesCollection diseasesCollection =
      DiseasesCollection(diseases: []);
  final RequestsCollection requestsCollection =
      RequestsCollection(requests: []);

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.role == role &&
        other.bloodGroup == bloodGroup &&
        other.address == address &&
        other.weight == weight &&
        other.age == age;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        role.hashCode ^
        bloodGroup.hashCode ^
        address.hashCode ^
        weight.hashCode ^
        age.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'role': role,
      'bloodGroup': bloodGroup,
      'address': address,
      'weight': weight,
      'age': age,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['person_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      contactNumber: map['contact_number'] as String,
      role: map['role'] as String,
      bloodGroup: sTringToBg[map['blood_group']] as BloodGroup,
      address: map['address'] as String,
      weight: map['weight'].toDouble(),
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Person.fromJsonn(Map<String, dynamic> json) {
    return Person(
      id: json['person_id'].toString(),
      name: json['name'],
      bloodGroup: sTringToBg[json['blood_group']] as BloodGroup,
      address: json['address'],
      age: json['age'] as int,
      contactNumber: json['contact_number'],
      email: json['email'],
      weight: json['weight'].toDouble(),
      role: json['role'] ?? 'user',
    );
  }

  @override
  String toString() {
    return 'Person(id: $id, name: $name, email: $email, contactNumber: $contactNumber, role: $role, bloodGroup: $bloodGroup, address: $address, weight: $weight, age: $age)';
  }
}
