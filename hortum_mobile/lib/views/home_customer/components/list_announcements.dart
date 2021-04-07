import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';

class AnnouncementsList extends StatefulWidget {
  final TextEditingController filter;
  final AnnounDataApi announData;

  const AnnouncementsList(
      {@required this.filter, @required this.announData, Key key})
      : super(key: key);

  @override
  _AnnouncementsListState createState() => _AnnouncementsListState();
}

class _AnnouncementsListState extends State<AnnouncementsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List announcements = widget.announData.announcements;
    return Container(
      height: size.height * 0.45,
      padding:
          EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
      margin: EdgeInsets.only(top: size.height * 0.06),
      child: ListView.builder(
        itemCount: announcements.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (announcements[index]['title']
              .toString()
              .toLowerCase()
              .contains(widget.filter.text.toLowerCase())) {
            return AnnouncementBox(
                profilePic: 'assets/images/perfil.jpg',
                name: announcements[index]['name'],
                title: announcements[index]['title'],
                localization: 'Asa Norte, 404 Feira Da Tarde',
                price: announcements[index]['price'],
                productPic: 'assets/images/banana.jpg');
          }
          return Container();
        },
      ),
    );
  }
}
