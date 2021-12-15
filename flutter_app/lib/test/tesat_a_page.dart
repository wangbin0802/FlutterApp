import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestAPage extends StatelessWidget {
  const TestAPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/Bpage");
                    Navigator.of(context).pop(false);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "first span...",
                          style: TextStyle(color: Colors.red),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(text: ","),
                        TextSpan(text: "third span...")
                      ],
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/WechatIMG14.jpeg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 2,
                crossAxisAlignment: WrapCrossAlignment.center,
                textDirection: TextDirection.ltr,
                children: List.generate(10, (i) {
                  double w = 50.0 + 10 * i;
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.primaries[i],
                    height: 50,
                    width: w,
                    child: Text("$i"),
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text("Welcome to singapore..."),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.amber, width: 1),
                    color: Colors.blue),
                transform: Matrix4.rotationZ(0.2),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: .8,
                  heightFactor: .3,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Left"),
                  Text("right"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    child: Text("文字也有水波纹效果"),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                  ),
                  splashColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
