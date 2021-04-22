import 'package:flutter/material.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/productor_details/productor_details.dart';

class ProductorsBox extends StatefulWidget {
  final String name;
  final String imageAsset;
  final String email;

  const ProductorsBox(
      {@required this.name, this.imageAsset, @required this.email, Key key})
      : super(key: key);
  @override
  _ProductorsBoxState createState() => _ProductorsBoxState();
}

class _ProductorsBoxState extends State<ProductorsBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.77,
      height: size.height * 0.08,
      margin: EdgeInsets.only(top: size.height * 0.03),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.25)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                offset: Offset(0, 4))
          ]),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductorDetails(email: encodeString(widget.email));
          }));
        },
        child: Row(
          children: [
            Container(
              width: size.width * 0.12,
              height: size.height * 0.06,
              margin: EdgeInsets.only(right: size.width * 0.06),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Material(
                  child: InkWell(
                      child: Image.asset(
                    'assets/images/perfil.jpg',
                    fit: BoxFit.fill,
                  )),
                ),
              ),
            ),
            Text(widget.name, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
