import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/profile/components/add_picture.dart';
import 'package:hortum_mobile/views/profile/components/circle_style.dart';
import 'package:hortum_mobile/views/profile/components/profile_form.dart';
import 'package:hortum_mobile/views/profile/components/profile_picture.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              CircleStyle(),
              Container(
                padding: EdgeInsets.only(
                    right: size.width * 0.1, left: size.width * 0.1),
                child: Column(
                  children: [ProfilePicture(), ProfileForm()],
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
