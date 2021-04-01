import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcements_data.dart';

class Carroussel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(right: size.width * 0.01),
          child: TextButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Material(
                      child: InkWell(
                          child: Image.asset(categories[index]['image_path'],
                              fit: BoxFit.fill,
                              height: size.height * 0.12,
                              width: size.height * 0.12)),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      categories[index]['name'],
                      style: TextStyle(
                          fontFamily: 'Roboto-Bold',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
