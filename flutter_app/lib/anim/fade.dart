import 'package:flutter/material.dart';

const owl_url = 'https://raw.githubusercontent'
    '.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  @override
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(owl_url),
        MaterialButton(
            child: Text(
              'Show details',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {
              setState(() {
                opacityLevel = 1.0;
              });
            }),
        AnimatedOpacity(
            opacity: opacityLevel,
            child: Column(
              children: <Widget>[
                Text('Type:Owl'),
                Text('Age:39'),
                Text('Employment:None')
              ],
            ),
            duration: Duration(seconds: 13))
      ],
    );
  }
}
