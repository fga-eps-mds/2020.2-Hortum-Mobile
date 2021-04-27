import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';

class ProductorDetaislService {
  static Widget completeAnnouncements(List<dynamic> announcements) {
    return Column(
        key: Key('columnAnnoun'),
        children: announcements
            .map<Widget>((dynamic announcement) => AnnouncementBox(
                profilePic: 'assets/images/perfil.jpg',
                email: announcement['email'],
                name: announcement['username'].toString().split(' ')[0],
                title: announcement['name'],
                localization: 'Asa Norte Feira 404',
                description: announcement['description'],
                price:
                    "R\$ ${announcement['price'].toStringAsFixed(2).replaceFirst('.', ',')}",
                productPic: 'assets/images/banana.jpg'))
            .toList());
  }
}
