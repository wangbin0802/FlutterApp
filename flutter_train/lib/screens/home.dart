import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_train/screens/category_page.dart';
import 'package:flutter_train/screens/trending_page.dart';
import 'package:flutter_train/util/categories.dart';
import 'package:flutter_train/util/friends.dart';
import 'package:flutter_train/util/restaurants.dart';
import 'package:flutter_train/widgets/category_item.dart';
import 'package:flutter_train/widgets/search_card.dart';
import 'package:flutter_train/widgets/slide_item.dart';

typedef RoutePage = Widget Function();

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
            _buildTitleRow('Trending Restaurants', context, () => const TrendingPage()),
            const SizedBox(height: 10),
            _buildRestaurantList(context),
            const SizedBox(height: 10),
            _buildTitleRow('Category', context, () => const CategoryPage()),
            const SizedBox(height: 10),
            _buildCategoryList(context),
            const SizedBox(height: 10),
            _buildTitleRow('Friends', context, () => const TrendingPage()),
            const SizedBox(height: 10),
            _buildFriendsList(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendsList(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: friends.length,
          itemBuilder: (_, index) {
            String img = friends[index];
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    img
                ),
                radius: 25.0,
              ),
            );
          }),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (_, index) {
            Map cate = categories[index];
            return CategoryItem(cate: cate);
          }),
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

  Widget _buildTitleRow(String title, BuildContext context, RoutePage routePage) {
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
                  context, MaterialPageRoute(builder: (context) => routePage()));
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
