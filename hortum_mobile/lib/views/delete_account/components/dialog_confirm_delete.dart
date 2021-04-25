import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/services/delete_account_services.dart';

Future<void> dialogDeleteConfirmUser(password, dio) async {
  return showDialog(
    context: globalKey.currentContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        key: Key('deleteUser'),
        title: Text('Deseja excluir sua conta?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Essa ação não pode ser desfeita!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              deleteUser(dio, password.text);
              Navigator.of(context).pop(false);
            },
            child: Text(
              "Sim",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 19,
                color: Color.fromARGB(0xFF, 244, 156, 0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "Não",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 19,
                color: Color.fromARGB(0xFF, 244, 156, 0),
              ),
            ),
          ),
        ],
      );
    },
  );
}
