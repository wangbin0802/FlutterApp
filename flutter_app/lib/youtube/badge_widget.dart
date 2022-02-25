import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatefulWidget {
  const BadgeWidget({Key? key}) : super(key: key);

  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badge app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Badge demo'),),
        body: Center(
          child: Column(
            children: [
              Badge(
                badgeContent: Text('9', style: TextStyle(color: Colors.white),),
                child: GestureDetector(
                  onTap: () {
                    print('access time on tap...');
                  },
                  child: Icon(
                    Icons.access_time,
                  ),
                ),
                badgeColor: Colors.blue,
                animationType: BadgeAnimationType.slide,
              ),
              TextField(

              )
            ],
          ),
        ),
      ),
    );
  }
}
