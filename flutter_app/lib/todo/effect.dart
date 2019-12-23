import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition'),
      ),
      body: GestureDetector(
        child: heroWidget,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: heroWidget,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Widget heroWidget = Hero(tag: 'IMG_HERO', child: Image.network(
    'https://picsum.photos/250?image=9'
));

