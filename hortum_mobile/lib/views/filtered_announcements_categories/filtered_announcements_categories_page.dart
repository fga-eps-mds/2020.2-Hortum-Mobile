import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/filtered_announcements_categories/services/filtered_announcements_services.dart';
import 'package:hortum_mobile/views/home_customer/components/list_announcements.dart';

class FilteredAnnounCategoryPage extends StatefulWidget {
  final Dio dio;
  final String filter;

  const FilteredAnnounCategoryPage({@required this.dio, this.filter, Key key})
      : super(key: key);
  @override
  _FilteredAnnounCategoryPageState createState() =>
      _FilteredAnnounCategoryPageState();
}

class _FilteredAnnounCategoryPageState
    extends State<FilteredAnnounCategoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnouncementsApi announData = new AnnouncementsApi(widget.dio);
    return FutureBuilder(
        future:
            FilteredAnnounPageServices.populateData(widget.filter, announData),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            body: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.08, left: size.width * 0.25),
                      child: Text(
                        widget.filter,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Comfortaa-Regular',
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    snapshot.connectionState == ConnectionState.done
                        ? Container(
                            height: size.height * 0.7,
                            margin: EdgeInsets.only(bottom: size.height * 0.55),
                            child: AnnouncementsList(
                              announData: announData,
                            ))
                        : Container(
                            height: size.height * 0.65,
                            margin: EdgeInsets.only(bottom: size.height * 0.05),
                          )
                  ],
                ),
              ),
              Footer()
            ]),
          );
        });
  }
}
