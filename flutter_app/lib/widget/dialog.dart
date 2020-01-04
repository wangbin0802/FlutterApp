import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: Icon(Icons.repeat),
          onPressed: () {
            return _neverSatisfied(context);
          }),
    );
  }

  Future<void> _neverSatisfied(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Rewind and remember'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You will never satisfied.'),
                  Text('You like me, I am nerver satified'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
