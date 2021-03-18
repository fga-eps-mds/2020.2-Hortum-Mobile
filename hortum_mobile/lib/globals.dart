import 'package:dio/dio.dart';

// Ip do usuário que está testando
// Para isso, adicione o ip ao ALLOWED_HOSTS no back !!
String url = 'http://127.0.0.1:8000/';
Dio dio = new Dio(new BaseOptions(
  baseUrl: url,
  connectTimeout: 5000,
  followRedirects: true,
));
