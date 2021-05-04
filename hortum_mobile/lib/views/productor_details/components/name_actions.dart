import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/complaint/complaint_page.dart';
import 'package:hortum_mobile/views/productor_details/services/productor_details_services.dart';

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
    String name = ProductorDetaislService.formatName(widget.name);
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.7,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: 'Roboto-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
              padding: EdgeInsets.only(top: 5, right: 10),
              icon: Icon(Icons.report, color: Color(0xffFF4D00)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ComplaintPage(
                    emailProductor: widget.email,
                  );
                }));
              }),
        ],
      ),
    );
  }
}
