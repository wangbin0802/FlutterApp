import 'package:flutter/material.dart';

class TestCPage extends StatelessWidget {
  const TestCPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C"),
      ),
      body: Center(
          child: Container(
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamedAndRemoveUntil(context, "/Apage", (route) => false);
                Navigator.pushNamed(context, "/Apage");
              },
              child: Text(
                "This is C",
              ),
            ),
          )),
    );
  }
}
