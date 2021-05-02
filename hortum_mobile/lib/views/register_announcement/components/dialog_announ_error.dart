import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/register_announcement/services/error_message_format.dart';

Future<void> dialogError(BuildContext context, var response) async {
  String msgError = Formarter.announErrorFormart(response.data.toString());
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        key: Key('erroNomeAnnoun'),
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
