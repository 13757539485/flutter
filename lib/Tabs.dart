import 'package:flutter/material.dart';
import 'package:startup_namer/pages/category.dart';
import 'package:startup_namer/pages/home.dart';
import 'package:startup_namer/pages/settings.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(index: this.index);
}

class _TabsState extends State<Tabs> {
  int _mCurrentIndex;
  List pages = [HomePage(), CategoryPage(), SettingsPage()]; //每个页面组件

  _TabsState({index}) {
    this._mCurrentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter'),
      ),
      body: this.pages[_mCurrentIndex],
      floatingActionButton: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white
        ),
        // margin: EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 40, color: Colors.black),
          onPressed: () {
            setState(() {
              this._mCurrentIndex = 1;
            });
          },
          backgroundColor:
              this._mCurrentIndex == 1 ? Colors.green : Colors.yellow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //每个Item设置内容
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('设置')),
        ],
        currentIndex: _mCurrentIndex, //默认选中的下标
        iconSize: 30, //设置icon的大小，对icon自身有大小的无效
        fixedColor: Colors.green, //选中后的颜色
        type: BottomNavigationBarType.fixed, //如果tab大于3个需要设置
        onTap: (int currentIndex) {
          //点击tab后触发
          setState(() {
            this._mCurrentIndex = currentIndex;
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.itying.com/images/flutter/3.png'),
                            fit: BoxFit.cover)),
                    accountName: Text('name'),
                    accountEmail: Text('email@163.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/2.png'),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text('首页'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('用户中心'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/user');
              },
            ),
            Divider(),
            ListTile(
              title: Text('设置'),
              onTap: () {},
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
