import 'package:flutter/material.dart';

class TestCPage extends StatelessWidget {
  TestCPage({Key key}) : super(key: key);

  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            snap: true,
            floating: true,
            leading: Icon(Icons.home),
            actions: [
              Icon(Icons.menu),
              Icon(Icons.ten_k)
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver bar demo"),
              background: Image.asset(
                "images/WechatIMG14.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 80,
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                childCount: 15),
          ),
        ],
      ),
    );
  }
}
