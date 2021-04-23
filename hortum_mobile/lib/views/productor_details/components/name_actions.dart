import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/reclamation/reclamation_page.dart';

class NameActionsWidget extends StatefulWidget {
  final String name;
  final String email;

  const NameActionsWidget({@required this.name, @required this.email, Key key})
      : super(key: key);

  @override
  _NameActionsWidgetState createState() => _NameActionsWidgetState();
}

class _NameActionsWidgetState extends State<NameActionsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.name,
              style: TextStyle(
                  fontFamily: 'Roboto-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          IconButton(
              padding: EdgeInsets.only(left: 10),
              icon: Icon(Icons.ios_share, color: Color(0xffA7DDB7)),
              onPressed: () {}),
          IconButton(
              padding: EdgeInsets.only(top: 5, right: 10),
              icon: Icon(Icons.report, color: Color(0xffFF4D00)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReclamationPage(
                    emailProductor: widget.email,
                  );
                }));
              }),
        ],
      ),
    );
  }
}
