import 'package:dio/dio.dart';

String url = 'http://localhost:8000';

Dio dio = new Dio(
    new BaseOptions(baseUrl: url, connectTimeout: 5000, followRedirects: true));
