import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/data/productor_favorite_backend.dart';
import 'package:hortum_mobile/services/codec_string.dart';
import 'package:hortum_mobile/views/favorites/fav_page.dart';
import 'package:hortum_mobile/views/productor_details/productor_details.dart';

class ProductorsBox extends StatefulWidget {
  final String name;
  final String imageAsset;
  final String email;
  final Dio dio;

  const ProductorsBox(
      {@required this.name,
      this.imageAsset,
      @required this.email,
      this.dio,
      Key key})
      : super(key: key);
  @override
  _ProductorsBoxState createState() => _ProductorsBoxState();
}

class _ProductorsBoxState extends State<ProductorsBox> {
  @override
  Widget build(BuildContext context) {
    ProductorFavAPI favProductor = new ProductorFavAPI(widget.dio);
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
            Text(widget.name, style: TextStyle(fontSize: 20)),
            Container(
              width: size.width * 0.1,
              height: size.height * 0.03,
              margin: EdgeInsets.only(left: size.width * 0.4),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: MaterialButton(
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
                onPressed: () async {
                  await favProductor.favProductor(widget.email);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FavPage()),
                      (route) => true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
