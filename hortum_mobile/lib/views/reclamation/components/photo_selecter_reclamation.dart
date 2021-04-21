import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelecterReclamation extends StatefulWidget {
  @override
  _PhotoSelecterReclamationState createState() =>
      _PhotoSelecterReclamationState();

  const PhotoSelecterReclamation({Key key}) : super(key: key);
}

class _PhotoSelecterReclamationState extends State<PhotoSelecterReclamation> {
  //File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        height: size.height * 0.118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  bottom: size.height * 0.01, right: size.width * 0.6),
              child: Text(
                'Imagem',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Comfortaa-Regular',
                    letterSpacing: -0.33,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffC4C4C4).withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: MaterialButton(
                height: size.height * 0.05,
                minWidth: size.width * 0.82,
                child: Text('+ Adicionar imagem'),
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);

                  setState(() {
                    if (pickedFile != null) {
                      //  _image = File(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
