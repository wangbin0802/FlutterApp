import 'package:flutter/material.dart';
import 'package:flutter_app/canvas/curve_draw.dart';

class CanvasDemo extends StatelessWidget {
  const CanvasDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          painter: CanvasDraw(),
        ),
      ),
    );
  }
}
