import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/views/home_productor/components/buttons_row.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';

class ListAnnouncement extends StatefulWidget {
  final ProdLoggedAnnounDataApi announProd;
  final Dio dio;

  const ListAnnouncement({@required this.announProd, this.dio, Key key})
      : super(key: key);

  @override
  _ListAnnouncementState createState() => _ListAnnouncementState();
}

class _ListAnnouncementState extends State<ListAnnouncement> {
  @override
  Widget build(BuildContext context) {
    List announcements = widget.announProd.announcements;
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.topCenter,
        height: size.height * 0.43,
        padding:
            EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
        child: announcements.length != 0
            ? ListView.builder(
                itemCount: announcements.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(children: [
                    ButtonsRow(
                      dio: widget.dio,
                      title: announcements[index]['name'],
                      localization: announcements[index]['localizations'],
                      price: announcements[index]['price'],
                      image: announcements[index]['images'][0],
                      description: announcements[index]['description'],
                      category: announcements[index]['type_of_product'],
                      inventory: announcements[index]['inventory'],
                    ),
                    AnnouncementBox(
                      profilePic: announcements[index]['pictureProductor'],
                      description: announcements[index]['description'],
                      name: announcements[index]['username'],
                      email: announcements[index]['email'],
                      title: announcements[index]['name'],
                      localizations: announcements[index]['localizations'],
                      price: announcements[index]['price'],
                      productPic: announcements[index]['images'],
                      isFavPage: false,
                      phone_number: announcements[index]['phone_number'],
                    )
                  ]);
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
