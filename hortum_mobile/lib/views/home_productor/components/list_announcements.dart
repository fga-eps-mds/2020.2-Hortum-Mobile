import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
//import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/views/home_productor/components/buttons_row.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';

class ListAnnouncement extends StatefulWidget {
  final ProdLoggedAnnounDataApi announProd;

  const ListAnnouncement({@required this.announProd, Key key})
      : super(key: key);

  @override
  _ListAnnouncementState createState() => _ListAnnouncementState();
}

class _ListAnnouncementState extends State<ListAnnouncement> {
  @override
  Widget build(BuildContext context) {
    List announcements = widget.announProd.announcements;
    return ListView.builder(
      itemCount: announcements.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Column(children: [
          ButtonsRow(title: announcements[index]['name']),
          AnnouncementBox(
              profilePic: 'assets/images/perfil.jpg',
              name: announcements[index]['username'],
              title: announcements[index]['name'],
              localization: 'Asa Norte, 404 Feira Da Tarde',
              price: announcements[index]['price'],
              productPic: 'assets/images/banana.jpg')
        ]);
      },
    );
  }
}
