import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/state/observers.dart';

class ShareDataWidget extends InheritedWidget {
  int data;

  ShareDataWidget({key, this.data, Widget child})
      : super(key: key, child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    throw oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  const InheritedWidgetTestRoute({Key key}) : super(key: key);

  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> with WidgetsBindingObserver {
  int count = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("[wb] dispose.....");
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("[wb] didChangeAppLifecycleState: $state");
    appStateObserver.value = state;
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            ElevatedButton(
              child: Text("Increment"),
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
