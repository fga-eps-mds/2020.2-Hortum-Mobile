import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/data/announ_data_backend.dart';
import 'package:hortum_mobile/views/home_customer/components/carroussel.dart';
import 'package:hortum_mobile/views/home_customer/components/home_type.dart';
import 'package:hortum_mobile/views/home_customer/components/list_announcements.dart';

import 'components/search.dart';

class CustomerHomePage extends StatefulWidget {
  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final TextEditingController _filter = TextEditingController();
  bool isAnnouncements = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnounDataApi announData = new AnnounDataApi();

    return FutureBuilder(
      future: announData.getAnnoun(_filter.text),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      key: Key('categoryCarr'),
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
                          border: Border.all(color: Color(0xff59981A)),
                          color: Colors.transparent),
                      child: Search(
                        controller: _filter,
                      )),
                  HomeType(
                    isAnnouncements: isAnnouncements,
                    onPressed: () {
                      this.isAnnouncements = !this.isAnnouncements;
                      setState(() {});
                    },
                  ),
                  snapshot.connectionState == ConnectionState.done
                      ? this.isAnnouncements
                          ? AnnouncementsList(
                              filter: _filter, announData: announData)
                          : Container()
                      : Container(
                          margin: EdgeInsets.only(top: size.height * 0.25),
                          child: SpinKitCircle(
                              color: Color(0xff47CC70).withOpacity(0.7))),
                ],
              ),
            ),
            Footer()
          ]),
        );
      },
    );
  }
}
