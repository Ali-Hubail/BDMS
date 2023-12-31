import 'dart:convert';

import 'package:bdms/domain/person.dart';
import 'package:http/http.dart' as http;

class PeopleRepository {
  List<Person> peopleList = [];
  List<Person> get people => peopleList;

  Future<List<Person>> fetchPeople() async {
    final res = await http.get(Uri.parse('http://10.0.2.2:8080/user/'));
    final List<dynamic> decodedRes = jsonDecode(res.body);
    List<Person> peopleList =
        decodedRes.map((jsonItem) => Person.fromJsonn(jsonItem)).toList();
    if (res.statusCode == 200) {
      return peopleList;
    }
    return [];
  }

  Future<bool> deletePerson(Person person) async {
    final res =
        await http.delete(Uri.parse('http://10.0.2.2:8080/user/${person.id}'));

    return res.statusCode == 200;
  }

  Future<bool> updatePerson(Person person, String? email, String? weight,
      String? ctn, String? add) async {
    final res = await http
        .patch(Uri.parse('http://10.0.2.2:8080/person/${person.id}'), body: {
      'email': email ?? person.email,
      'weight': weight ?? person.weight,
      'contact_number': ctn ?? person.contactNumber,
      'address': add ?? person.address,
    });

    if (email != null) {
      person.email = email;
    }

    if (weight != null) {
      person.weight = double.parse(weight);
    }

    if (ctn != null) {
      person.contactNumber = ctn;
    }

    if (add != null) {
      person.address = add;
    }

    return res.statusCode == 200;
  }
}
