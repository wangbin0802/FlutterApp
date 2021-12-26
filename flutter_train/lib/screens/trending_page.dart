import 'package:flutter/material.dart';
import 'package:flutter_train/util/restaurants.dart';
import 'package:flutter_train/widgets/search_card.dart';
import 'package:flutter_train/widgets/trending_item.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Trending Restaurants'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SearchCard(),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                Map restaurant = restaurants[index];
                return TrendingItem(item: restaurant);
              },
            )
          ],
        ),
      ),
    );
  }
}
