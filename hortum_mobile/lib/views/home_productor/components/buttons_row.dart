import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcements_data.dart';
import 'package:hortum_mobile/data/announ_delete_backend.dart';

class ButtonsRow extends StatefulWidget {
  final String title;

  const ButtonsRow({@required this.title, Key key}) : super(key: key);
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonsRow> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Deseja excluir esse anúncio?'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Essa ação não pode ser desfeita.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            DeleteAnnounApi.deleteAnnoun(widget.title);
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 19,
                              color: Color.fromARGB(0xFF, 244, 156, 0),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            "Não",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 19,
                              color: Color.fromARGB(0xFF, 244, 156, 0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
