import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/home_customer/components/carroussel.dart';

import 'components/search.dart';

class CustomerHomePage extends StatefulWidget {
  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.08),
                  padding: EdgeInsets.only(left: 10),
                  height: size.height * 0.25,
                  child: Carroussel()),
              Container(
                  width: size.width * 0.8,
                  height: size.height * 0.04,
                  padding: EdgeInsets.only(
                      left: size.width * 0.02, right: size.width * 0.05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.4)),
                  child: Search(
                    controller: _filter,
                  )),
              Container(
                height: size.height * 0.45,
                padding: EdgeInsets.only(
                    right: size.width * 0.05, left: size.width * 0.05),
                margin: EdgeInsets.only(top: size.height * 0.06),
                child: ListView.builder(
                  itemCount: announcements.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (announcements[index]['title']
                        .toString()
                        .toLowerCase()
                        .contains(_filter.text.toLowerCase())) {
                      return AnnouncementBox(
                          profilePic: announcements[index]['profilePic'],
                          name: announcements[index]['name'],
                          title: announcements[index]['title'],
                          localization: announcements[index]['localization'],
                          price: announcements[index]['price'],
                          productPic: announcements[index]['productPic']);
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
        Footer()
      ]),
    );
  }
}
