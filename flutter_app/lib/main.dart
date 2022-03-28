import 'package:flutter/material.dart';
import 'package:flutter_app/canvas/canvas_demo.dart';
import 'package:flutter_app/rive/play_pause_animation.dart';
import 'package:flutter_app/test/tesat_a_page.dart';
import 'package:flutter_app/test/test_b_page.dart';
import 'package:flutter_app/test/test_c_page.dart';

import 'youtube/animation_stagger.dart';

void main() {
  const String _name = "Wang Bin";
  runApp(MaterialApp(
    title: 'Passing Data',
    theme: ThemeData(
      primaryColor: Colors.red,
    ),
    home: Scaffold(
      drawer: Drawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Text("Book"),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: "Me")
        ],
      ),
      backgroundColor: Colors.white,
      body: CanvasDemo(),
    ),
    initialRoute: "/",
    routes: {
      "/Apage": (context) => TestAPage(),
      "/Bpage": (context) => TestBPage(),
      "/Cpage": (context) => TestCPage(),
    },
  ));
}
