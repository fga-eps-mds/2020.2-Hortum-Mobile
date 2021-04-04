import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/introScreen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreenPage(),
    );
  }
}
