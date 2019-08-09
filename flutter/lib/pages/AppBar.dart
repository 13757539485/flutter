import 'package:flutter/material.dart';
import 'package:startup_namer/Tabs.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[Tab(text: 'remen'), Tab(text: 'tuijian')],
            ),
            title: Text('AppBarDemo'),
          ),
          body: TabBarView(
            children: <Widget>[
              ListTile(
                title: Text('data1'),
              ),
              ListTile(
                title: Text('data2'),
              ),
            ],
          )),
    );
  }
}
