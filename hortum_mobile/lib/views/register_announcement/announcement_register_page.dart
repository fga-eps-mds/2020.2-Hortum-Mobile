import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/views/register_announcement/components/announ_register_form.dart';

class RegisterAnnounPage extends StatefulWidget {
  final Dio dio;

  const RegisterAnnounPage({Key key, this.dio}) : super(key: key);
  @override
  _RegisterAnnounPageState createState() => _RegisterAnnounPageState();
}

class _RegisterAnnounPageState extends State<RegisterAnnounPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: size.height * 0.9,
              child: ListView(
                key: Key('registerAnnouncementForm'),
                children: <Widget>[
                  PhotoSelecter(
                    title: 'CRIAR ANÚNCIO',
                  ),
                  AnnounRegisterForm(
                    dio: widget.dio,
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
