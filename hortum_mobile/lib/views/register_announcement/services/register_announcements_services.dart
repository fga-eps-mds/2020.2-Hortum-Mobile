import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:hortum_mobile/views/register_announcement/components/dialog_announ_error.dart';

Future<void> registerAnnounServices(
    String name,
    String description,
    double price,
    String category,
    BuildContext context,
    AnnouncementsApi registerData) async {
  var response =
      await registerData.registerAnnoun(name, description, price, category);
  String msgError = announErrorFormart(response.data.toString());
  if (response.statusCode != 201) {
    dialogError(context, msgError);
  } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProductorHomePage()),
        (route) => route.isCurrent);
  }
}

String announErrorFormart(String responseMsg) {
  if (responseMsg == '{images: [This field is required.]}')
    return 'É preciso adicionar uma imagem';
  else
    return 'Nome de anúncio já utilizado';
}
