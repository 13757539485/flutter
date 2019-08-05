import 'package:flutter/material.dart';

class TabControllerPage extends StatefulWidget {//必须继承动态组件
  TabControllerPage({Key key}) : super(key: key);

  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage>
    with SingleTickerProviderStateMixin {//实现此接口
  TabController _tabController;

  @override
  void initState() {//初始化会回调
    super.initState();
    this._tabController = TabController(length: 2, vsync: this);
    this._tabController.addListener((){});//监听点击，回调两次
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabControllerPage'),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: '热门'),
            Tab(text: '推荐'),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[Text('热门'), Text('推荐')],
      ),
    );
  }
}
