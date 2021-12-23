import 'package:flutter/material.dart';

import 'hero_1.dart';

class HeroDemo extends StatefulWidget {
  const HeroDemo({Key? key}) : super(key: key);

  @override
  _HeroDemoState createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 3,
        ),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Hero1(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                          position:
                              Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(animation),
                          child: child,
                        )),
              ),
              child: Hero(
                tag: "hero1",
                child: Container(
                  child: Image.asset(
                    "images/WechatIMG14.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.red,
          );
        }),
      ),
    );
  }
}
