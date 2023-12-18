import 'dart:convert';

import 'package:http/http.dart' as http;

class ReportsRepository {
  Map<String, dynamic> bloodTotal = {
    'sum': 0,
    'count': 0,
  };

  List<Map<String, dynamic>> bloodReportsByGroup = [];

  Future<Map<String, dynamic>> getBloodTotal(String view) async {
    final res = await http.get(Uri.parse('http://10.0.2.2:8080/report/'));
    num sum = 0;
    var count = 0;
    if (res.statusCode == 200) {
      final decodedRes = jsonDecode(res.body) as Map<String, dynamic>;
      for (int i = 0; i < decodedRes['bloodDonation'].length; i++) {
        final date =
            DateTime.parse(decodedRes['bloodDonation'][i]['expiration_date'])
                .subtract(const Duration(days: 365));
        if (DateTime.now().difference(date) <=
            (view == 'week'
                ? const Duration(days: 7)
                : const Duration(days: 31))) {
          sum += decodedRes['bloodDonation'][i]['quantity'];
          count++;
        }
      }
    }

    bloodTotal['sum'] = sum;
    bloodTotal['count'] = count;

    return bloodTotal;
  }

  Future<List<Map<String, dynamic>>> getBloodReportsByGroup() async {
    final res = await http.get(Uri.parse('http://10.0.2.2:8080/report/'));

    if (res.statusCode == 200) {
      final List<dynamic> decodedRes = jsonDecode(res.body)['byBlood'];
      for (int i = 0; i < decodedRes.length; i++) {
        bloodReportsByGroup.add({
          'blood_group': decodedRes[i]['blood_group'],
          'sum': decodedRes[i]['sum'],
          'count': decodedRes[i]['count'],
        });
      }
    }

    return bloodReportsByGroup;
  }
}
