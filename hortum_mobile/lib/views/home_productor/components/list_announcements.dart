import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/views/home_productor/components/buttons_row.dart';

class ListAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: announcements.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Column(children: [
          ButtonsRow(
              title: announcements[index]['title'],
              localization: announcements[index]['localization'],
              price: announcements[index]['price'],
              description: announcements[index]['description'],
              category: announcements[index]['category']),
          AnnouncementBox(
              profilePic: announcements[index]['profilePic'],
              email: announcements[index]['email'],
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
