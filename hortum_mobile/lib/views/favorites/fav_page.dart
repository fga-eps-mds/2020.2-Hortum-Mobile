import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/list_announcements.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';
import 'package:hortum_mobile/views/favorites/components/select_favorite_button.dart';
import 'package:hortum_mobile/views/favorites/services/fav_page_services.dart';
import 'package:hortum_mobile/views/home_customer/components/list_productors.dart';

class FavPage extends StatefulWidget {
  final Dio dio;
  final bool isAnnouncement;

  const FavPage({@required this.isAnnouncement, this.dio, Key key})
      : super(key: key);
  @override
  _FavPageState createState() => _FavPageState(isAnnouncement: isAnnouncement);
}

class _FavPageState extends State<FavPage> {
  bool isAnnouncement;

  _FavPageState({this.isAnnouncement});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnnouncementsApi announData = new AnnouncementsApi(widget.dio);
    ProductorsDataApi productorsData = new ProductorsDataApi(widget.dio);
    return FutureBuilder(
        future: FavPageServices.populateData(isAnnouncement, announData,
            productorsData: productorsData),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            body: Stack(children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.08),
                      child: Text(
                        'FAVORITOS',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Comfortaa-Regular',
                            letterSpacing: -0.33,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    FavSelectButton(
                      isAnnouncement: this.isAnnouncement,
                      onClickActionAnnoun: () {
                        isAnnouncement = true;
                        setState(() {});
                      },
                      onClickActionProductor: () {
                        isAnnouncement = false;
                        setState(() {});
                      },
                    ),
                    snapshot.connectionState == ConnectionState.done
                        ? this.isAnnouncement
                            ? Container(
                                height: size.height * 0.7,
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.55),
                                child: AnnouncementsList(
                                  announData: announData,
                                  isFavPage: true,
                                  textNotFound:
                                      "Nenhum favorito adicionado.\nAdicione tocando no curtir de alguma postagem!",
                                ))
                            : Container(
                                height: size.height * 0.65,
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.05),
                                child: ProductorsList(
                                    textNotFound:
                                        "Nenhum produtor favorito adicionado.\nAdicione tocando no favoritar de alguma postagem!",
                                    productorsData: productorsData,
                                    isFavPage: true))
                        : Container(
                            margin: EdgeInsets.only(top: size.height * 0.25),
                            child: SpinKitCircle(
                                key: Key('spin'),
                                color: Color(0xff47CC70).withOpacity(0.7))),
                  ],
                ),
              ),
              Footer()
            ]),
          );
        });
  }
}
