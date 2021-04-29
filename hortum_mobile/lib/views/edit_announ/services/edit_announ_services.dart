import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';

class ChangeServices {
  static Future editAnnoun(
      Dio dio,
      String originalTitle,
      String title,
      double precoDouble,
      String category,
      String description,
      BuildContext context) async {
    final AnnouncementsApi announcementsApi = AnnouncementsApi(dio);
    if (title == originalTitle) title = null;
    var response = await announcementsApi.editAnnoun(originalTitle,
        name: title,
        price: precoDouble,
        category: category,
        description: description);
    if (response.statusCode != 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            key: Key('erroAoEditar'),
            title: Text("Erro!"),
            content: Text(
              "Este nome de anúncio já foi utilizado.",
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
      return Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductorHomePage();
      }));
    }
  }
}
