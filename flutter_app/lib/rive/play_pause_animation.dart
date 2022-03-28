import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  late RiveAnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() {
        _isPlaying = false;
      }),
      onStart: () => setState(() {
        _isPlaying = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          controllers: [_controller],
          onInit: (_) => setState(() {}),
          animations: ['idle', 'curves'],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
