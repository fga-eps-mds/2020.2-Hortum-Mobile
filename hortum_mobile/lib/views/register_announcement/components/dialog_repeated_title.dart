import 'package:flutter/material.dart';

Future<void> dialogRepeatedError(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        key: Key('erroNomeAnnoun'),
        title: Text("Erro!"),
        content: Text(
          "Nome de anúncio já utilizado!",
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
