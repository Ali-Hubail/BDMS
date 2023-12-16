import 'package:bdms/data/authentication_repository.dart';
import 'package:http/http.dart' as http;

class RequestsRepository {
  Future<void> getDrRpHistory() async {
    final drRp = AuthenticationRepository.authInstance.signedInUser;
    final id = drRp.id;
    final res =
        await http.get(Uri.parse('http://10.0.2.2:8080/person/history/$id'));

    print(res.statusCode);
    print(res.body);
  }
}
