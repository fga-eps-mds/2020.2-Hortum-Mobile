import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/profile_picture.dart';
import 'package:hortum_mobile/components/spin.dart';
import 'package:hortum_mobile/data/productor_details_backend.dart';
import 'package:hortum_mobile/views/productor_details/components/announcements_details.dart';
import 'package:hortum_mobile/views/productor_details/components/name_actions.dart';

class ProductorDetails extends StatefulWidget {
  final String email;
  final String name;
  final String productorProfilePicture;
  final Dio dio;

  const ProductorDetails(
      {@required this.email,
      @required this.name,
      @required this.productorProfilePicture,
      this.dio,
      Key key})
      : super(key: key);

  @override
  _ProductorDetailsState createState() => _ProductorDetailsState();
}

class _ProductorDetailsState extends State<ProductorDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProductorsDetailsApi prodData = ProductorsDetailsApi(widget.dio);
    return FutureBuilder(
      future: prodData.getDetails(widget.email),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Stack(
                children: [
                  CircleStyle(color: Color(0xff478C5C), opacity: 0.25),
                  snapshot.connectionState == ConnectionState.done
                      ? Container(
                          width: size.width,
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            key: Key('productorDetails'),
                            children: [
                              ProfilePicture(
                                width: size.height * 0.2,
                                heigth: size.height * 0.2,
                                radius: 70,
                                bottomMargin: size.height * 0.02,
                                productorProfile:
                                    widget.productorProfilePicture,
                              ),
                              NameActionsWidget(
                                name: widget.name,
                                email: widget.email,
                              ),
                              AnnouncementsDetails(prodData: prodData)
                            ],
                          ))
                      : SpinWidget(margin: 0),
                  Footer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
