import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

registerUser(String username, String email, String password) async {
  Response response;
  try {
    response = await dio.post('/signup/customer/', data: {
      "user": {"username": username, "email": email, "password": password}
    });
    print(response.data);
  } on DioError catch (erro) {
    print(erro);
  }
}
