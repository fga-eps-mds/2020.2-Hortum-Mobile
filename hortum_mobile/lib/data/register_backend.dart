import 'package:hortum_mobile/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> createAlbum(String title) async {
  String body = json.encode(User);
  final response = await http.post(
    Uri.https('jsonplaceholder.typicode.com', 'users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );

  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao cadastrar usuário.');
  }
}
