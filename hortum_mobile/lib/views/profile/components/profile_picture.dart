import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.1, bottom: size.height * 0.05),
      width: size.width * 0.3,
      height: size.width * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Material(
          child: InkWell(
              child: Image.asset(
            'assets/images/perfil.jpg',
            fit: BoxFit.fill,
          )),
        ),
      ),
    );
  }
}
