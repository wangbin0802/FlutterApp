import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestBPage extends StatefulWidget {
  TestBPage({key}) : super(key: key);

  @override
  State<TestBPage> createState() => _TestBPageState();
}

class _TestBPageState extends State<TestBPage> {
  bool _checkBox = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("B"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 60,
                width: 200,
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
                  decoration: InputDecoration(
                    fillColor: Color(0x30cccccc),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00FF0000)),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    hintText: "Please input",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff00ff)),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
              ),
              Checkbox(
                value: _checkBox,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _checkBox = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.greenAccent,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              _buildPageView(),
            ],
          ),
        ));
  }

  List<String> pageList = ["PageView1", "PageView2", "PageView3"];
  int _currentPageIndex = 0;

  Widget _buildPageView() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/Cpage");
      },
      child: Center(
        child: Container(
          height: 230,
          child: Stack(
            children: [
              PageView.builder(
                itemBuilder: (context, index) {
                  return _buildPageViewItem(pageList[index % pageList.length]);
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index % pageList.length;
                  });
                },
                itemCount: pageList.length,
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        pageList.length,
                        (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPageIndex == index ? Colors.blue : Colors.grey),
                            )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewItem(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
