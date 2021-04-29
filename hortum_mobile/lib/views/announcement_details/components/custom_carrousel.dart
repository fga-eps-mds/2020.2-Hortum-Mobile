import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarrousel extends StatefulWidget {
  final String productPic;
  const CustomCarrousel({@required this.productPic, Key key}) : super(key: key);
  @override
  _CustomCarrouselState createState() => _CustomCarrouselState();
}

class _CustomCarrouselState extends State<CustomCarrousel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CarouselController buttonCarrouselContoller = CarouselController();
    return CarouselSlider(
      carouselController: buttonCarrouselContoller,
      options: CarouselOptions(height: size.height * 0.25, viewportFraction: 1),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: size.width * 0.9,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.black.withOpacity(0.25)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.35),
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                          child: Image.asset(widget.productPic,
                              fit: BoxFit.fill,
                              height: size.height * 0.25,
                              width: size.width * 0.9)),
                    ),
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.06,
                    margin: EdgeInsets.only(top: size.height * 0.1),
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.keyboard_arrow_left_outlined,
                          size: 35, color: Colors.grey),
                      onPressed: () {
                        buttonCarrouselContoller.previousPage();
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.06,
                    margin: EdgeInsets.only(
                        top: size.height * 0.1, left: size.width * 0.8),
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.keyboard_arrow_right_outlined,
                          size: 35, color: Colors.grey),
                      onPressed: () {
                        buttonCarrouselContoller.nextPage();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
