import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

void dialogDeleteConfirm(context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Deseja excluir esse anúncio?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Essa ação não pode ser desfeita.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              print("Botão Sim");
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
