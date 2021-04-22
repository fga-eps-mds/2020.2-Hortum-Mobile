import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/edit_announ/edit_page.dart';
import 'package:hortum_mobile/views/home_productor/components/dialog_confirm_delete.dart';

class ButtonsRow extends StatefulWidget {
  final String title;
  final String description;
  final String localization;
  final String price;
  final String category;

  const ButtonsRow(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.localization,
      @required this.category,
      Key key})
      : super(key: key);

  @override
  _ButtonRowState createState() => _ButtonRowState(
      title: title,
      description: description,
      price: price,
      localization: localization,
      category: category);
}

class _ButtonRowState extends State<ButtonsRow> {
  final String title;
  final String description;
  final String localization;
  final String price;
  final String category;

  _ButtonRowState(
      {this.title,
      this.description,
      this.localization,
      this.price,
      this.category});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title =
        TextEditingController(text: widget.title);
    final TextEditingController description =
        TextEditingController(text: widget.description);
    final TextEditingController localization =
        TextEditingController(text: widget.localization);
    final TextEditingController price =
        TextEditingController(text: widget.price);
    final TextEditingController category =
        TextEditingController(text: widget.category);
    Size size = MediaQuery.of(context).size;

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
              child: Icon(
                Icons.visibility_off,
                size: 25,
                color: Color(0xFF478C5C),
              ),
              onPressed: () {},
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
