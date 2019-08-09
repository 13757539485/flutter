import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(//需要在Scaffold外面包裹
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Row(//放在title中是为了解决两个appBar问题
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TabBar(//tab栏名字
                  onTap: (index){
                    print('onTap($index)');
                  },
                    tabs: <Widget>[Tab(text: 'remen'), Tab(text: 'tuijian')],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(//具体每个tab页面组件
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