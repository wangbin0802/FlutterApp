import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CounterPage.dart';
import 'package:flutter_app/anim/logo.dart';
import 'package:flutter_app/anim/stagger.dart';
import 'package:flutter_app/route.dart';
import 'package:flutter_app/todo/Todo.dart';
import 'package:flutter_app/todo/TodosScreen.dart';
import 'package:flutter_app/todo/effect.dart';
import 'package:flutter_app/widget/assets.dart';
import 'package:flutter_app/widget/general_widget.dart';
import 'package:flutter_app/widget/manage_state.dart';
import 'package:flutter_app/widget/openbrowser.dart';
import 'package:flutter_app/widget/spinner.dart';
import 'package:flutter_app/widget/stack.dart';

import 'ShoppingList.dart';
import 'anim/fade.dart';
import 'anim/shapeshift.dart';
import 'layout.dart';
import 'part/partdisplay.dart';
import 'test/drag_demo.dart';
import 'test/text_demo.dart';
import 'widget/chat_screen.dart';

void main() {
  const String _name = "Wang Bin";
//  runApp(MyApp());

//  runApp(MaterialApp(
//    title: 'Passing Data',
//    home: TodosScreen(todos: List.generate(20, (i) => Todo(
//        'Todo $i',
//        'A description of what needs to be done for Todo $i'))),
//  ));
  runApp(MaterialApp(
    title: 'Passing Data',
    initialRoute: '/',
//    home: TodosScreen(todos: List.generate(20, (i) => Todo(
//        'Todo $i',
//        'A description of what needs to be done for Todo $i'))),
//    home: MainScreen(),
    home: Scaffold(
      backgroundColor: Colors.white,
      body: DragDemo()
    ),
    routes: {
      "new_page": (context) => ChatScreen(),
    },
  ));

}


class SampleAppPage extends StatefulWidget {
  int initValue = 0;
  SampleAppPage(this.initValue, {Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  void didUpdateWidget(covariant SampleAppPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(children: widgets),
      )
    );
  }

  Future<void> _refresh() {

  }

  Widget getRow(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widgets = List.from(widgets);
          widgets.add(getRow(widgets.length));
          print('row $i');
        });
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Row $i'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.add,
          color: Colors.green[500],
        ),
        Icon(
          Icons.add,
          color: Colors.green[500],
        ),
        Icon(
          Icons.add,
          color: Colors.green[500],
        ),
        Icon(
          Icons.add,
          color: Colors.black,
        ),
        Icon(
          Icons.add,
          color: Colors.black,
        ),
      ],
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: ShoppingListPage(
//          products: <Product>[
//            Product('Apple'),
//            Product('Orange'),
//            Product('Peach')
//          ]
//      ),
//    home: MyHomePage(),
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Flutter layout demo'),
//          ),
//          body: ListView(
//            children: <Widget>[
//              imageLayout,
//              titleLayout,
//              buttons,
//              textSlection,
//              textFieldArea,
//              floatActionButton
//            ],
//          )),
//      home: FirstRoute(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstRoute(),
        '/second': (context) => SecondRoute(),
      },
    );
  }
}

Widget buildCard() => SizedBox(
      height: 200,
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '163 club',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('My City, Ganzhou'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('wangbin@qq.com'),
              subtitle: Text('People road'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            )
          ],
        ),
      ),
    );

Widget buildListView() => ListView(
      children: <Widget>[
        _tile('Cinkdkdk kdkd kdkd ', 'I 9 kd ol', Icons.theaters),
        _tile('Cinkdkdk 3i4b kdkd ', 'I 9 kd d', Icons.theaters),
        _tile('Cinkdkdk ufu4y rpto ', 'I 9 kdjdol', Icons.theaters),
        Divider(),
        Container(
          decoration: BoxDecoration(),
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is a text',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Divider(),
        _tile('Cinkdkdk ufu4y rpto ', 'I 9 kdjdol', Icons.restaurant),
        _tile('Cinkdkdk kd rpto ', 'I 9 yu', Icons.restaurant),
        _tile('Cinkdkdk 11 rpto ', 'I 9 dd', Icons.restaurant),
        _tile('Cinkdkdk ssd rpto ', 'I 9 d', Icons.restaurant),
      ],
    );

ListTile _tile(String title, String subTitle, IconData iconData) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    subtitle: Text(subTitle),
    leading: Icon(
      iconData,
      color: Colors.blue[500],
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: null,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times so quickly',
            ),
            Text(
              '$_counter',
//              style: Theme.of(context).textTheme.display1,
            ),
            Text('Hello, how are you?',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal)),
            Text.rich(TextSpan(text: "Rich text start", children: <TextSpan>[
              TextSpan(
                  text: " this is for you",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Colors.green)),
              TextSpan(
                  text: " Do you know",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.black87)),
            ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const FlutterLogo(),
                const Expanded(
                    child: Text(
                        'Flutter\'s hot reload helps you quickly and easily experiment.',
                        textAlign: TextAlign.center)),
                const Icon(Icons.sentiment_satisfied)
              ],
            ),
            ListView(
              children: <Widget>[],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
