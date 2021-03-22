import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/register/components/register_form.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final picker = ImagePicker();
  File _image;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                bottom: size.height * 0.05,
                                top: size.height * 0.02),
                            child: Text(
                              'CADASTRO',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontFamily: 'Comfortaa-Regular',
                                  letterSpacing: -0.33,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              height: size.height * 0.15,
                              minWidth: size.width * 0.3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70)),
                              child: Icon(
                                Icons.add_a_photo,
                                size: 40,
                              ),
                              onPressed: () async {
                                final pickedFile = await picker.getImage(
                                    source: ImageSource.gallery);

                                setState(() {
                                  if (pickedFile != null) {
                                    _image = File(pickedFile.path);
                                  } else {
                                    print('No image selected.');
                                  }
                                });
                              },
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
