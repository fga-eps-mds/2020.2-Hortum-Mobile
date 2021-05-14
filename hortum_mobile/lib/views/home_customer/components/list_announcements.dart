import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';

class AnnouncementsList extends StatefulWidget {
  final AnnouncementsApi announData;

  const AnnouncementsList({@required this.announData, Key key})
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
        height: size.height * 0.43,
        padding:
            EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
        child: announcements.length != 0
            ? ListView.builder(
                itemCount: announcements.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return AnnouncementBox(
                      profilePic: announcements[index]['pictureProductor'],
                      email: announcements[index]['email'],
                      name: announcements[index]['username'],
                      title: announcements[index]['name'],
                      localizations: announcements[index]['localizations'],
                      price: announcements[index]['price'],
                      productPic: announcements[index]['images'],
                      description: announcements[index]['description']);
                },
              )
            : Container(
                margin: EdgeInsets.only(top: size.height * 0.15),
                width: size.width * 0.6,
                child: Text(
                  "Infelizmente!!\nNão encontramos nenhum resultado para a sua busca",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff1D8E40), fontSize: 15),
                ),
              ));
  }
}
