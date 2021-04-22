import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinWidget extends StatefulWidget {
  final double margin;

  const SpinWidget({@required this.margin, Key key}) : super(key: key);

  @override
  _SpinWidgetState createState() => _SpinWidgetState();
}

class _SpinWidgetState extends State<SpinWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: widget.margin),
        child: SpinKitCircle(
            key: Key('spin'), color: Color(0xff47CC70).withOpacity(0.7)));
  }
}
