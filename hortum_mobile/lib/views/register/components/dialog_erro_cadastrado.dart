import 'package:flutter/material.dart';

Future<void> dialogErroCadastrado(String msgError, BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        key: Key('dialogErroCadastrado'),
        title: Text("Erro!"),
        content: Text(
          msgError,
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
