import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/productors_box.dart';
import 'package:hortum_mobile/data/productors_data_backend.dart';

class ProductorsList extends StatefulWidget {
  final ProductorsDataApi productorsData;

  const ProductorsList({@required this.productorsData, Key key})
      : super(key: key);
  @override
  _ProductorsListState createState() => _ProductorsListState();
}

class _ProductorsListState extends State<ProductorsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List productors = widget.productorsData.productors;
    return Container(
        height: size.height * 0.43,
        padding:
            EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
        child: productors.length != 0
            ? ListView.builder(
                itemCount: productors.length,
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ProductorsBox(
                      name: productors[index]['username'],
                      imageAsset: productors[index]['idPicture']);
                },
              )
            : Container(
                margin: EdgeInsets.only(top: size.height * 0.15),
                width: size.width * 0.6,
                child: Text(
                  "Infelizmente!!\nNão encontramos nenhum resultado para a sua busca",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff1D8E40), fontSize: 15),
                ),
              ));
  }
}
