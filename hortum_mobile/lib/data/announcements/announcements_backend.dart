import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hortum_mobile/globals.dart';

class AnnouncementsApi {
  Dio dio;
  List<dynamic> announcements = [];

  AnnouncementsApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future getAnnoun(String filter) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String url;
    if (filter.isEmpty)
      url = 'http://$ip:8000/announcement/list';
    else
      url = 'http://$ip:8000/announcement/list/${filter}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess
    };
    Response response =
        await this.dio.get(url, options: Options(headers: header));
    this.announcements = response.data;
    manipulateData();
  }

  Future registerAnnoun(String name, String description, List localization,
      double price, String category) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = actualUser.tokenAccess;
    String url = 'http://$ip:8000/announcement/create';
    var header = {
      "Authorization": "Bearer " + userAccessToken,
    };
    List<String> localizacao = [];

    int index = 0;
    localization.forEach((element) {
      if (element.text != TextEditingValue.empty) {
        localizacao.insert(index, element.text);
        index++;
      }
    });

    String email = actualUser.email;
    var params = FormData.fromMap({
      "email": email,
      "name": name,
      "description": description,
      "price": price,
      "type_of_product": category,
      "localizations": localizacao,
    });

    for (File item in announImages) {
      String filename = item.path.split('/').last;
      params.files.addAll([
        MapEntry("images",
            await MultipartFile.fromFile(item.path, filename: filename)),
      ]);
    }

    try {
      Response response = await this.dio.post(url,
          data: params,
          options: Options(
            headers: header,
            contentType: 'multipart/form-data',
            validateStatus: (status) {
              return status <= 500;
            },
          ));

      return response;
    } on DioError catch (err) {
      print(err);
    }
  }

  Future deleteAnnoun(String anuncio) async {
    String userAccessToken = actualUser.tokenAccess;
    String url = 'http://$ip:8000/announcement/update/$anuncio';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    Response response =
        await this.dio.delete(url, options: Options(headers: header));
    return response.statusCode;
  }

  Future editAnnoun(String nomeOriginal,
      {String name,
      String description,
      double price,
      String category,
      bool inventory,
      List localizations}) async {
    String url = 'http://$ip:8000/announcement/update/$nomeOriginal';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    List<String> localizacao = [];

    int index = 0;
    localizations.forEach((element) {
      localizacao.insert(index, element.text);
      index++;
    });

    Map params = {
      "name": name,
      "description": description,
      "price": price,
      "type_of_product": category,
      "inventory": inventory,
      "localizations": localizacao
    };
    params.removeWhere((key, value) => value == null);

    String _body = json.encode(params);

    var response = await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response;
  }

  manipulateData() {
    this.announcements.forEach((element) {
      element['price'] =
          "R\$ ${element['price'].toStringAsFixed(2).replaceFirst('.', ',')}";
      element['username'] = element['username'].toString().split(" ")[0];
    });
  }
}
