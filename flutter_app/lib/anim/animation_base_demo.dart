import 'package:flutter/material.dart';

class AnimationBaseDemo extends StatefulWidget {
  const AnimationBaseDemo({Key? key}) : super(key: key);

  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}

class _AnimationBaseDemoState extends State<AnimationBaseDemo> with SingleTickerProviderStateMixin {
  double _size = 10;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 100,
        upperBound: 200)
      ..addListener(() {
        // print("animation listener value:${_animationController.value}");
        setState(() {
          _size = _animationController.value;
        });
      })
      ..addStatusListener((status) {
        print("animation listener status:$status");
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _animationController.forward();
        },
        child: Container(
          height: _size,
          width: _size,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "点我变大",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
