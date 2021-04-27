import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/user_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

Future<void> deleteUser(Dio dio, String password, BuildContext context) async {
  final UserAPI deleteData = new UserAPI(dio);
  var response = await deleteData.deleteUser(password);
  if (response.statusCode != 204) {
    showDialog(
      context: context,
      barrierDismissible: false,
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
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                key: Key('okButton'),
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
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route.isCurrent);
  }
}
