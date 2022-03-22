import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationStaggerDemo extends StatefulWidget {
  const AnimationStaggerDemo({Key? key}) : super(key: key);

  @override
  _AnimationStaggerDemoState createState() => _AnimationStaggerDemoState();
}

class _AnimationStaggerDemoState extends State<AnimationStaggerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stagger Animation'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView.builder(
            itemBuilder: _shareIconView,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  Widget _shareIconView(BuildContext context, int index) => AnimationConfiguration.staggeredList(
    duration: const Duration(milliseconds: 500),
    position: index,
    child: SlideAnimation(
      verticalOffset: 300,
      child: FadeInAnimation(
        child: InkWell(
          onTap: () {

          },
          child: Container(
            width: (MediaQuery.of(context).size.width - 46) / 4.5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'images/pic1.jpg',
                    width: 50,
                    height: 50,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Text(
                  'whatsapp',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );

}
