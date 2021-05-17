import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/views/filtered_announcements_categories/filtered_announcements_categories_page.dart';

class Carroussel extends StatefulWidget {
  final Dio dio;
  const Carroussel({@required this.dio, Key key}) : super(key: key);
  @override
  _CarrousselState createState() => _CarrousselState();
}

class _CarrousselState extends State<Carroussel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(right: size.width * 0.01),
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FilteredAnnounCategoryPage(
                  filter: categories[index]['name'],
                  dio: widget.dio,
                );
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                          child: Image.asset(categories[index]['image_path'],
                              fit: BoxFit.fill,
                              height: size.height * 0.12,
                              width: size.height * 0.12)),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      categories[index]['name'],
                      style: TextStyle(
                          fontFamily: 'Roboto-Bold',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
