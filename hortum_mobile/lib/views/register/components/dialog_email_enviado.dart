import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

Future<void> dialogEmailEnviado(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        key: Key('dialogEmailEnviado'),
        title: Text("Email enviado"),
        content: Text(
          "Verifique sua caixa de email com o link para ativar sua conta",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
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
}
