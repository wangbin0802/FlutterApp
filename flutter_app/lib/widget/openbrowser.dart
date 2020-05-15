import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoPage extends StatelessWidget {
  launchURL() {
    launch("https://flutter.dev");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
      onPressed: launchURL,
      child: Text("show flutter homepage"),
    ),);
  }


}
