import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/pages/home_page.dart';
import 'package:flutter_xiecheng/pages/my_page.dart';
import 'package:flutter_xiecheng/pages/search_page.dart';
import 'package:flutter_xiecheng/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  final Color _defalutColor = Colors.grey;
  final Color _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: this._controller,
          children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text('首页'),
                icon: Icon(Icons.home, color: this._defalutColor),
                activeIcon: Icon(Icons.home, color: this._activeColor)),
            BottomNavigationBarItem(
                title: Text('搜索'),
                icon: Icon(Icons.search, color: this._defalutColor),
                activeIcon: Icon(Icons.search, color: this._activeColor)),
            BottomNavigationBarItem(
                title: Text('旅拍'),
                icon: Icon(Icons.camera, color: this._defalutColor),
                activeIcon: Icon(Icons.camera, color: this._activeColor)),
            BottomNavigationBarItem(
                title: Text('我的'),
                icon: Icon(Icons.account_circle, color: this._defalutColor),
                activeIcon:
                    Icon(Icons.account_circle, color: this._activeColor))
          ],
          currentIndex: this._currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: this._activeColor,
          onTap: (index) {
            this._controller.jumpToPage(index);
            setState(() {
              this._currentIndex = index;
            });
          },
        ));
  }
}
