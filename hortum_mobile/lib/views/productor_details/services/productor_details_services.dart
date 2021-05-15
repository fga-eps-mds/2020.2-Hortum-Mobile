import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';

class ProductorDetaislService {
  static Widget completeAnnouncements(List<dynamic> announcements, Size size) {
    if (announcements.length != 0) {
      return Column(
          key: Key('columnAnnoun'),
          children: announcements
              .map<Widget>((dynamic announcement) => AnnouncementBox(
                  profilePic: announcement['pictureProductor'],
                  email: announcement['email'],
                  description: announcement['description'],
                  name: announcement['username'].toString().split(' ')[0],
                  title: announcement['name'],
                  localizations: announcement['localizations'],
                  price:
                      "R\$ ${announcement['price'].toStringAsFixed(2).replaceFirst('.', ',')}",
                  productPic: announcement['images'],
                  isFavPage: false))
              .toList());
    }
    return Container(
      width: size.width * 0.65,
      child: Text(
        "Este produtor não possui anúncios disponíveis no momento !",
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xff1D8E40)),
      ),
    );
  }

  static String formatName(String name) {
    if (name.length > 25) {
      return name.split(' ')[0] + ' ' + name.split(' ')[1];
    } else
      return name;
  }
}
