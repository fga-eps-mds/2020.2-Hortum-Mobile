import 'package:flutter/material.dart';

class FavSelectButton extends StatefulWidget {
  final bool isAnnouncement;
  final Function onClickActionAnnoun;
  final Function onClickActionProductor;
  const FavSelectButton(
      {@required this.isAnnouncement,
      @required this.onClickActionAnnoun,
      @required this.onClickActionProductor,
      Key key})
      : super(key: key);
  @override
  _FavSelectButtonState createState() => _FavSelectButtonState();
}

class _FavSelectButtonState extends State<FavSelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('favSelectButton'),
      padding: EdgeInsets.only(top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              primary: widget.isAnnouncement
                  ? Color.fromARGB(0xFF, 189, 225, 183)
                  : Colors.white,
              side: BorderSide(
                  width: 1.2, color: Color.fromARGB(0xFF, 89, 152, 26)),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(0xFF, 89, 152, 26)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15))),
            ),
            onPressed: widget.onClickActionAnnoun,
            child: Text(
              'Anúncios',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 17.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              primary: !widget.isAnnouncement
                  ? Color.fromARGB(0xFF, 189, 225, 183)
                  : Colors.white,
              side: BorderSide(
                  width: 1.2, color: Color.fromARGB(0xFF, 89, 152, 26)),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(0xFF, 89, 152, 26)),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
            onPressed: widget.onClickActionProductor,
            child: Text(
              'Produtores',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 17.0,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
