import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_train/screens/trending_page.dart';
import 'package:flutter_train/util/restaurants.dart';
import 'package:flutter_train/widgets/search_card.dart';
import 'package:flutter_train/widgets/slide_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildRestaurantRow('Trending Restaurants', context),
            const SizedBox(height: 10),
            _buildRestaurantList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            Map restaurant = restaurants[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SlideItem(
                img: restaurant['img'],
                title: restaurant['title'],
                address: restaurant['address'],
                rating: restaurant['rating'],
              ),
            );
          }),
    );
  }

  Widget _buildRestaurantRow(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const TrendingPage()));
            },
            child: Text(
              'See all(9)',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            )),
      ],
    );
  }

  PreferredSize _buildSearchBar(BuildContext context) {
    return PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 30.0 : 50.0, left: 10.0, right: 10.0),
          child: SearchCard(),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 60.0));
  }
}
