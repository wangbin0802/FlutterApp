import 'package:flutter/material.dart';
import 'package:flutter_train/screens/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.label,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: List.generate(5, (index) => const Home()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 7),
            _buildTabIcon(0),
            _buildTabIcon(1),
            _buildTabIcon(2),
            _buildTabIcon(3),
            _buildTabIcon(4),
            const SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        onPressed: () => _pageController?.jumpToPage(2),
      ),
    );
  }

  Widget _buildTabIcon(int index) {
    if (index == 2) {
      return IconButton(
        onPressed: null,
        icon: Icon(
          icons[index],
          size: 24,
          color: Colors.transparent,
        ),
      );
    } else {
      return IconButton(
        onPressed: () => _pageController?.jumpToPage(index),
        icon: Icon(
          icons[index],
          size: 24,
        ),
        color: _page == index
            ? Theme.of(context).accentColor
            : Theme.of(context).textTheme.caption!.color,
      );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
