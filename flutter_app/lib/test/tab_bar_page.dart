import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.languageCode);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxlsScrolled) => [
        SliverAppBar(
          expandedHeight: 230,
          pinned: true,
          title: Text("NestedScrollView"),
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: PageView(),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyTabBarDelegate(
              child: TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
              Tab(
                text: "资讯",
              ),
              Tab(
                text: "技术",
              )
            ],
          )),
        )
      ],
      body: TabBarView(
        controller: _tabController,
        children: [
          RefreshIndicator(
            child: _buildTabNewsList(1),
            onRefresh: () async => print("on refresh"),
          ),
          _buildTabNewsList(0),
        ],
      ),
    );
  }

  Widget _buildTabNewsList(int type) {
    if (type == 1) {
      return Column(
        children: List.generate(
            5,
            (index) => Container(
                  child: Text("news line:$index"),
                )),
      );
    } else {
      return Column(
        children: [
          ..._buildNews(),
          Container(
            child: PopupMenuButton(
              offset: Offset(0, 140),
              initialValue: "3",
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "1",
                  child: Text("语文"),
                ),
                PopupMenuItem(
                  value: "2",
                  child: Text("数学"),
                ),
                PopupMenuItem(
                  value: "3",
                  child: Text("英语"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Draggable(
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "wang",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            feedback: Container(
              height: 100,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "wang",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(0, 20),
          ),
          Container(
            height: 150,
            width: 150,
            child: InteractiveViewer(
              child: Image.asset("images/WechatIMG14.jpeg"),
            ),
          ),
          IconButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Welcom to back."),
                action: SnackBarAction(
                  label: "确定",
                  onPressed: () => print(""),
                ),
            )
          ),
              icon: Icon(Icons.eighteen_mp))
        ],
      );
    }
  }

  List<Widget> _buildNews() {
    return List.generate(
        5,
        (index) => Container(
              child: Text("technical line:$index"),
            ));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
