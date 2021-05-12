import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/announcements/announcements_backend.dart';
import 'package:hortum_mobile/views/edit_announ/edit_page.dart';
import 'package:hortum_mobile/views/home_productor/components/dialog_confirm_delete.dart';

import '../home_productor_page.dart';

class ButtonsRow extends StatefulWidget {
  final Dio dio;
  final String title;
  final String description;
  final List localization;
  final String price;
  final String category;
  final bool inventory;

  const ButtonsRow(
      {this.dio,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.localization,
      @required this.category,
      @required this.inventory,
      Key key})
      : super(key: key);

  @override
  _ButtonRowState createState() => _ButtonRowState(
      title: title,
      description: description,
      price: price,
      localization: localization,
      category: category,
      inventory: inventory);
}

class _ButtonRowState extends State<ButtonsRow> {
  final String title;
  final String description;
  final List localization;
  final String price;
  final String category;
  final bool inventory;

  _ButtonRowState(
      {this.title,
      this.description,
      this.localization,
      this.price,
      this.category,
      this.inventory});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title =
        TextEditingController(text: widget.title);
    final TextEditingController description =
        TextEditingController(text: widget.description);
    final List<TextEditingController> localization = [];
    int index = 0;
    widget.localization.forEach((element) {
      localization.insert(index, new TextEditingController(text: element));
      index++;
    });
    final TextEditingController price =
        TextEditingController(text: widget.price);
    final TextEditingController category =
        TextEditingController(text: widget.category);
    Size size = MediaQuery.of(context).size;
    AnnouncementsApi announcementsApi = new AnnouncementsApi();

    return Container(
      color: Color(0xFFECF87F).withOpacity(0.4),
      height: size.height * 0.03,
      width: size.width * 0.26,
      margin: EdgeInsets.only(left: size.width * 0.55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * 0.03,
            width: size.width * 0.06,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.edit,
                size: 25,
                color: Color(0xFF478C5C),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditPage(
                    title: title,
                    description: description,
                    price: price,
                    localization: localization,
                    category: category,
                    originaltitle: widget.title,
                  );
                }));
              },
            ),
          ),
          Container(
            height: size.height * 0.03,
            width: size.width * 0.06,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              child: inventory
                  ? Icon(
                      Icons.visibility,
                      size: 25,
                      color: Color(0xFF478C5C),
                    )
                  : Icon(
                      Icons.visibility_off,
                      size: 25,
                      color: Color(0xFF478C5C),
                    ),
              onPressed: () async {
                await announcementsApi.editAnnoun(title.text,
                    inventory: !inventory);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductorHomePage(dio: widget.dio);
                }));
              },
            ),
          ),
          Container(
            height: size.height * 0.03,
            width: size.width * 0.06,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              child: Icon(
                Icons.delete,
                size: 25,
                color: Color(0xFF478C5C),
              ),
              onPressed: () {
                dialogDeleteConfirm(context, widget.title);
              },
            ),
          ),
        ],
      ),
    );
  }
}
