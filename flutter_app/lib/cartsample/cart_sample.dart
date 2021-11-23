import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Item {
  double price;
  int count;
 
  Item(this.price, this.count);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({Key key}) : super(key: key);

  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
            child: ChangeNotifierProvider<CartModel>(
              create: (context) {
                return CartModel();
              },
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    Consumer<CartModel>(builder: (context, cart, widget) {
                      return Text("总价: ${cart.totalPrice}");
                    }),
                    Builder(builder: (context) {
                      print("11111111");
                      return RaisedButton(onPressed: () {});
                    })
                  ],
                );
              }),
            ));
      }
    );
  }
}
