import 'package:flutter/material.dart';
import 'package:hortum_mobile/views/advanced_settings/advanced_settings_page.dart';

class AdvancedSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.only(top: 6),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AdvancedSettingsPage()),
            (route) => route.isCurrent);
      },
      child: Text(
        "Avançado",
        style: TextStyle(
            fontSize: 15.0,
            decoration: TextDecoration.underline,
            color: Color(0xff219653)),
      ),
    );
  }
}
