import 'package:flutter/material.dart';

class TweenSequenceDemo extends StatefulWidget {
  const TweenSequenceDemo({Key? key}) : super(key: key);

  @override
  _TweenSequenceDemoState createState() => _TweenSequenceDemoState();
}

class _TweenSequenceDemoState extends State<TweenSequenceDemo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..addListener(() {
        setState(() {

        });
      });

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 1.0)));

    _sizeAnimation = Tween(begin: 100.0, end: 300.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 1.0)));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _animationController.forward(),
            child: Container(
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
              color: _colorAnimation.value,
            ),
          )
        ],
      ),
    );
  }
}
