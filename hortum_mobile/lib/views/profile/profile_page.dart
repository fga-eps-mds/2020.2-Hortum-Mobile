import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/circle_style.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/components/profile_picture.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/profile/components/profile_form.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController(text: actualUser.email);
    TextEditingController username =
        TextEditingController(text: actualUser.username);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(color: Color(0xff478C5C), opacity: 0.2),
              Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.1, left: size.width * 0.1),
                child: Column(
                  key: Key('profileContent'),
                  children: [
                    ProfilePicture(
                        width: size.width * 0.3,
                        heigth: size.width * 0.3,
                        radius: 50,
                        bottomMargin: size.height * 0.06),
                    ProfileForm(email: email, username: username),
                  ],
                ),
              ),
              AddPictureButton(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
