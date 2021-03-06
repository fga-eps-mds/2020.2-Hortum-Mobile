import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComplaintBox extends StatefulWidget {
  final String author;
  final String description;
  final String image;

  const ComplaintBox({
    this.author,
    this.description,
    this.image,
    Key key,
  });

  @override
  _ComplaintBoxState createState() => _ComplaintBoxState();
}

class _ComplaintBoxState extends State<ComplaintBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      key: Key('containerComplaintBox'),
      margin: EdgeInsets.only(bottom: size.height * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffF46A6A)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 0,
              offset: Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(size.height * 0.01),
            child: Text(
              widget.author,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Comfortaa',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xffF46A6A), width: size.height * 0.00075),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(size.height * 0.01),
            child: Text(
              widget.description,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto-Bold',
              ),
            ),
          ),
          widget.image != null
              ? Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                          height: size.height * 0.2,
                          width: size.height * 0.2,
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
