import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/views/home_productor/components/buttons_row.dart';

class ListAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: announcements.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Column(children: [
          Container(
              color: Color(0xFFECF87F).withOpacity(0.4),
              height: size.height * 0.03,
              width: size.width * 0.26,
              margin: EdgeInsets.only(left: size.width * 0.55),
              child: ButtonsRow(title: announcements[index]['title'])),
          AnnouncementBox(
              profilePic: announcements[index]['profilePic'],
              name: announcements[index]['name'],
              title: announcements[index]['title'],
              localization: announcements[index]['localization'],
              price: announcements[index]['price'],
              productPic: announcements[index]['productPic'])
        ]);
      },
    );
  }
}
