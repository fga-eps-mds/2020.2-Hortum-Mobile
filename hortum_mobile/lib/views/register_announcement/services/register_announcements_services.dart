import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/home_productor/home_productor_page.dart';
import 'package:hortum_mobile/views/register_announcement/components/dialog_announ_error.dart';

Future<void> registerAnnounServices(Dio dio, String name, String description,
    double price, String category, BuildContext context) async {
  final AnnouncementsApi registerData = new AnnouncementsApi(dio);
  var response =
      await registerData.registerAnnoun(name, description, price, category);
  if (response.statusCode != 201) {
    dialogError(context, response);
  } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProductorHomePage()),
        (route) => route.isCurrent);
  }
}
