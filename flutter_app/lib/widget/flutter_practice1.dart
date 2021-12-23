import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipRout extends StatelessWidget {
  const TipRout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 120),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.accessible,
                color: Colors.green,
              ),
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.error,
                color: Colors.green,
              ),
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.green,
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.wallpaper),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_lock),
              labelText: "密码",
              hintText: "你的登录密码",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            obscureText: true,
          )
        ],
      ),
    );
  }
}
