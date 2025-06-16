import 'package:http/http.dart' as http;
import 'user_model.dart';

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  // Se o servidor retornar uma resposta OK com status code 200, converta o JSON. 
  if (response.statusCode == 200) {
    return userFromJson(response.body);
  } else {
    // Se o servidor não retornar uma resposta 200 OK, lance uma exceção. 
    throw Exception('Failed to load users');
  }
}
