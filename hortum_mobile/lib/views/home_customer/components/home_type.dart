import 'package:flutter/material.dart';

class HomeType extends StatefulWidget {
  final String type;
  final onPressedAnnoun;
  final onPressedProduc;
  final onPressedLocal;

  const HomeType(
      {@required this.type,
      @required this.onPressedAnnoun,
      @required this.onPressedProduc,
      @required this.onPressedLocal,
      Key key})
      : super(key: key);
  @override
  _HomeTypeState createState() => _HomeTypeState();
}

class _HomeTypeState extends State<HomeType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.only(top: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: size.height * 0.14,
          child: OutlinedButton(
            key: Key('announButton'),
            style: ElevatedButton.styleFrom(
              primary: widget.type == "name"
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
            onPressed: widget.onPressedAnnoun,
            child: Text(
              'Anúncios',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 12),
              textAlign: TextAlign.start,
              softWrap: false,
              textScaleFactor: 0.91,
            ),
          ),
        ),
        Container(
          width: size.height * 0.14,
          child: OutlinedButton(
            key: Key('productorButton'),
            style: ElevatedButton.styleFrom(
              primary: widget.type == "Produc"
                  ? Color.fromARGB(0xFF, 189, 225, 183)
                  : Colors.white,
              side: BorderSide(
                  width: 1.2, color: Color.fromARGB(0xFF, 89, 152, 26)),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(0xFF, 89, 152, 26)),
                  borderRadius: BorderRadius.zero),
            ),
            onPressed: widget.onPressedProduc,
            child: Text(
              'Produtores',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 12),
              textScaleFactor: 0.91,
              softWrap: false,
            ),
          ),
        ),
        Container(
          width: size.height * 0.14,
          child: OutlinedButton(
            key: Key('localizationButton'),
            style: ElevatedButton.styleFrom(
              primary: widget.type == "localizations__adress"
                  ? Color.fromARGB(0xFF, 189, 225, 183)
                  : Colors.white,
              side: BorderSide(
                  width: 1.2, color: Color.fromARGB(0xFF, 89, 152, 26)),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromARGB(0xFF, 89, 152, 26)),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
            ),
            onPressed: widget.onPressedLocal,
            child: Text(
              'Localizações',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 12,
              ),
              softWrap: false,
              textScaleFactor: 0.91,
            ),
          ),
        )
      ]),
    );
  }
}
