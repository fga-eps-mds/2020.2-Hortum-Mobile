import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/data/prod_log_data_backend.dart';
import 'package:hortum_mobile/views/home_productor/components/list_announcements.dart';

class ProductorHomePage extends StatefulWidget {
  final Dio dio;

  const ProductorHomePage({this.dio, Key key}) : super(key: key);
  @override
  _ProductorHomePageState createState() => _ProductorHomePageState();
}

class _ProductorHomePageState extends State<ProductorHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProdLoggedAnnounDataApi announProd =
        new ProdLoggedAnnounDataApi(widget.dio);

    return FutureBuilder(
        future: announProd.getAnnounProd(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            body: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.08),
                      child: Text(
                        'MEUS ANÚNCIOS',
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
                            height: size.height * 0.75,
                            margin: EdgeInsets.only(bottom: size.height * 0.05),
                            child: ListAnnouncement(
                              announProd: announProd,
                            ))
                        : Container(
                            margin: EdgeInsets.only(top: size.height * 0.16),
                            child: Text(
                              "Infelizmente!!\nNão encontramos nenhum resultado para a sua busca",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff1D8E40), fontSize: 15),
                            ))
                  ],
                ),
              ),
              Footer()
            ]),
          );
        });
  }
}
