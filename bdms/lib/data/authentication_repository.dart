import 'package:bdms/domain/person.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  late final Person user;
  get signedInUser => user;
  static final AuthenticationRepository _instance =
      AuthenticationRepository._();

  static get authInstance => _instance;

  factory AuthenticationRepository() {
    return _instance;
  }

  AuthenticationRepository._();

  Future<bool> signIn(String email, String password) async {
    final res =
        await http.post(Uri.parse('http://10.0.2.2:8080/auth/login'), body: {
      'email': email,
      'password': password,
    });
    user = Person.fromJson(res.body);
    return res.statusCode == 200;
  }

  Future<bool> signUp(
    String email,
    String password,
    String age,
    String weight,
    String contactNumber,
    String address,
    String bloodGroup,
    String name,
  ) async {
    final res =
        await http.post(Uri.parse('http://10.0.2.2:8080/auth/signup'), body: {
      'name': name,
      'email': email,
      'age': age,
      'weight': weight,
      'contact_number': 'sfhasigoia',
      'address': address,
      'blood_group': bloodGroup,
      'password': password,
    });

    return res.statusCode == 200;
  }
}
