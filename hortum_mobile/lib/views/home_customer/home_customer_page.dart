import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/spin.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';
import 'package:hortum_mobile/views/home_customer/components/carroussel.dart';
import 'package:hortum_mobile/views/home_customer/components/home_type.dart';
import 'package:hortum_mobile/views/home_customer/components/list_announcements.dart';
import 'package:hortum_mobile/views/home_customer/components/list_productors.dart';
import 'package:hortum_mobile/views/home_customer/services/home_customer_services.dart';

import 'components/search.dart';

class CustomerHomePage extends StatefulWidget {
  final Dio dio;

  const CustomerHomePage({this.dio, Key key}) : super(key: key);
  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final TextEditingController _filter = TextEditingController();
  String type = "Announ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnouncementsApi announcementsApi = AnnouncementsApi(widget.dio);
    ProductorsDataApi productorsData = new ProductorsDataApi(widget.dio);

    return FutureBuilder(
      future: HomeCustomerServices.populateData(
          type, _filter.text, announcementsApi, productorsData),
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
                    type: type,
                    onPressedAnnoun: () {
                      this.type = "Announ";
                      setState(() {});
                    },
                    onPressedProduc: () {
                      this.type = "Produc";
                      setState(() {});
                    },
                    onPressedLocal: () {
                      this.type = "Local";
                      setState(() {});
                    },
                  ),
                  snapshot.connectionState == ConnectionState.done
                      ? (this.type == "Announ" || this.type == "Local")
                          ? AnnouncementsList(announData: announcementsApi)
                          : ProductorsList(productorsData: productorsData)
                      : SpinWidget(margin: size.height * 0.25),
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
