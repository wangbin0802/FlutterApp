import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/json/address.dart';

class TestAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildRow(),
    );
  }

  Widget buildRow() {
    decodeJson();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image.asset('images/pic1.jpg'),
        ),
        Expanded(child: Image.asset('images/pic2.jpg')),
        Expanded(
          child: Image.asset('images/pic3.jpg'),
        ),
      ],
    );
  }

  void decodeJson() {
    String jsonStr = """{
        "name": "John Smith",
    "email": "john@example.com"}""";
    Map<String, dynamic> user = jsonDecode(jsonStr);
    print('hello, ${user['name']}, ${user['email']}');

    Address address = Address("Jurong west street 65", "singapore");
    String json = jsonEncode(address);
    print("json=" + json);
    Map<String, dynamic> addressConvert = jsonDecode(json);
    print("json=" + addressConvert['street']);
    Address addressResult = Address.fromJson(addressConvert);
    print("address=${addressResult.city}");
  }
}
