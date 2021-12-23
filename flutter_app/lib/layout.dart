import 'package:flutter/material.dart';

Widget titleLayout = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
//      Icon(
//        Icons.star,
//        color: Colors.red[500],
//      ),
      FavoriteWidget(),
//      Text('41')
    ],
  ),
);

Widget imageLayout = Container(
  padding: EdgeInsets.only(bottom: 8),
  child: Image.asset(
    'images/WechatIMG14.jpeg',
    width: 600,
    height: 240,
    fit: BoxFit.fitWidth,
  ),
);

Widget textSlection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

Widget buttons = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      buildButtonColum(Colors.blue[300]!, Icons.call, 'CALL'),
      buildButtonColum(Colors.blue[300]!, Icons.near_me, 'ROUTE'),
      buildButtonColum(Colors.blue[300]!, Icons.share, 'SHARE'),
    ],
  ),
);

Column buildButtonColum(Color color, IconData iconData, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        iconData,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() {
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(bool newValue) {
    setState(() {
      _isFavorited = newValue;
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteBox(_isFavorited, _favoriteCount, _toggleFavorite);
  }
}

class FavoriteBox extends StatelessWidget {
  FavoriteBox(this._isFavorited, this._favoriteCount, this.onChanged);

  final ValueChanged<bool> onChanged;
  final bool _isFavorited;
  final int _favoriteCount;

  void handleChanged() {
    onChanged(!_isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              onPressed: handleChanged),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text(
              '$_favoriteCount',
            ),
          ),
        )
      ],
    );
  }
}

Widget textFieldArea = Container(
  padding: const EdgeInsets.only(left: 10, right: 10),
  child: TextField(
    obscureText: false,
    decoration: InputDecoration(
        fillColor: Colors.blue,
        border: OutlineInputBorder(),
        labelText: 'Password'),
  ),
);

Widget floatActionButton = Container(
    margin: EdgeInsets.all(10),
    child: FloatingActionButton.extended(
      onPressed: null,
      label: Text('Approve'),
      icon: Icon(
        Icons.thumb_up,
        color: Colors.red[300],
      ),
      backgroundColor: Colors.pink,
    ));

