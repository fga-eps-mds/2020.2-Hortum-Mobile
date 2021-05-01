import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/user_data_backend.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/delete_account/components/dialog_delete_error.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

Future<void> deleteUser(Dio dio, String password, BuildContext context) async {
  final UserAPI deleteData = new UserAPI(dio);
  var response = await deleteData.deleteUser(password);
  if (response.statusCode != 204) {
    dialogDeleteError(context);
  } else {
    actualUser.deleteUser();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route.isCurrent);
  }
}
