import 'package:flutter/material.dart';
import 'package:flutter_app/anim/water_ripple.dart';

import 'circle_progress_view.dart';

class CircleProgressPage extends StatefulWidget {
  const CircleProgressPage({Key? key}) : super(key: key);

  @override
  _CircleProgressPageState createState() => _CircleProgressPageState();
}

class _CircleProgressPageState extends State<CircleProgressPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circle progress"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) => CustomPaint(
                    painter: CircleProgressPainter(double.parse(value.toString())),
                    child: Center(
                      child: Text("${(double.parse(value.toString()) * 100).floor()}%"),
                    ),
                  ),
                )),
            Container(
              width: 200,
              height: 200,
              child: WaterRipple(
                count: 3,
                color: Color(0xFF0080ff),
              ),
            ),
            Container(
              child: StreamBuilder<int>(
                  stream: counter(),
                  builder: (context, snapshot) {
                    return Text('change ${snapshot.data}');
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Offstage(
                      offstage: false,
                      child: Text(
                        'Color red part',
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 150
                    ),
                    child: Text(
                      "right side ddde33555 5533355566777744667777",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.value(5);
  }
}
