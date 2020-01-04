import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 8.0,
      runSpacing: 4.0,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('AH'),
          ),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('BB'),
          ),
          label: Text('BALALA'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('CC'),
          ),
          label: Text('CACA'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('DD'),
          ),
          label: Text('DECDEC'),
        ),
      ],
    );
  }
}
