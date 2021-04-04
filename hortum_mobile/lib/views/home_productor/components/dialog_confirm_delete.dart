import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/data/announ_delete_backend.dart';

void dialogDeleteConfirm(context, index) {
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
              DeleteAnnounApi.deleteAnnoun(announcements[index]['title']);
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
