import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/user_delete_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

Future<void> deleteUser(Dio dio, String password) async {
  final DeleteUserAPI deleteData = new DeleteUserAPI(dio);
  var response = await deleteData.deleteUser(password);
  if (response.statusCode != 204) {
    showDialog(
      context: globalKey.currentContext,
      builder: (context) {
        return AlertDialog(
          key: Key('erroAoDeletar'),
          title: Text("Erro!"),
          content: Text(
            "Senha incorreta!",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  color: Color.fromARGB(0xFF, 244, 156, 0),
                ),
              ),
            )
          ],
        );
      },
    );
  } else {
    actualUser.deleteUser();
    Navigator.pushAndRemoveUntil(
        globalKey.currentContext,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route.isCurrent);
  }
}
