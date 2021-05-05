import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/photo_select.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/register_announcement/components/announ_register_form.dart';

class RegisterAnnounPage extends StatefulWidget {
  final Dio dio;

  const RegisterAnnounPage({this.dio});
  @override
  _RegisterAnnounPageState createState() => _RegisterAnnounPageState();
}

class _RegisterAnnounPageState extends State<RegisterAnnounPage> {
  @override
  Widget build(BuildContext context) {
    AnnouncementsApi announcementsApi = AnnouncementsApi(widget.dio);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height,
                child: Column(
                  key: Key('registerAnnouncementForm'),
                  children: <Widget>[
                    Container(
                        height: size.height * 0.9,
                        child: ListView(children: [
                          PhotoSelecter(
                            title: 'CRIAR ANÚNCIO',
                            isAnnounRegister: true,
                          ),
                          AnnounRegisterForm(
                            announcementsApi: announcementsApi,
                          ),
                        ])),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
