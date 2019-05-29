import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<BottomNavigationBarItem> bottomItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('首页'),
      backgroundColor: Colors.red,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('项目'),
      backgroundColor: Colors.red,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('体系'),
      backgroundColor: Colors.red,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('公众号'),
      backgroundColor: Colors.red,
    ),
  ];

  final List<Widget> pages = <Widget>[
    PageOne(),
    PageOne(),
    PageOne(),
    PageOne()
  ];
  int pageIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
//        backgroundColor: Colors.white,
        items: bottomItems,
        elevation: 20,
        iconSize: 30,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          pageIndex = index;
          pageController.jumpToPage(index);
          setState(() {});
        },
      ),
    );
  }

  void onPageChanged(int index) {
    pageIndex = index;
    setState(() {});
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with AutomaticKeepAliveClientMixin {
  String text = 'first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Text(text),
          RaisedButton(
            child: const Text('Tap Me'),
            onPressed: () {
              text = 'second';
              setState(() {});
            },
          ),
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
