import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocalizationField extends StatefulWidget {
  final List<TextEditingController> localizations;

  const LocalizationField({@required this.localizations, Key key})
      : super(key: key);

  @override
  _LocalizationFieldState createState() =>
      _LocalizationFieldState(localizations: localizations);
}

class _LocalizationFieldState extends State<LocalizationField> {
  final List<TextEditingController> localizations;

  _LocalizationFieldState({this.localizations});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: Key('localizationField'),
      decoration: new BoxDecoration(
        color: Color(0XFFC4C4C4),
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(15.0),
          bottomRight: const Radius.circular(15.0),
        ),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: localizations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: size.height * 0.005,
                right: size.width * 0.05,
                left: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.55,
                  child: Text(
                    localizations[index].text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
                IconButton(
                  key: Key('removeLocalization'),
                  icon: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      localizations.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
