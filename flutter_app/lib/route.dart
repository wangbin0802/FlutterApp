import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First route'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              // Navigate
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => SecondRoute()));
            Navigator.pushNamed(context, '/second');
            }),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second route'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('go back'),
            onPressed: () {
              // Navigate to first
              Navigator.pop(context);
            }),
      ),
    );
  }
}
