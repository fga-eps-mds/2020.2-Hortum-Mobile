import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHttp {
  Future<Map> fetch() async {
    //var url = 'http://localhost:8000/signup/confirm/';
    var url = 'https://jsonplaceholder.typicode.com/todos/1';
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return json;
  }
}
