import 'package:flutter/material.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: "hero",
          child: Container(
            child: Image.asset("images/WechatIMG14.jpeg", fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
