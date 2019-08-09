import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  PageViewPage({Key key}) : super(key: key);

  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
      ),
      body: PageView(
            children: <Widget>[],
            pageSnapping: false,//是否自动会弹，默认true
            reverse: true,//页面顺序倒置，默认false
            scrollDirection: Axis.vertical,//滑动放心，默认水平
            onPageChanged: (currentPage){//监听页面变化，回调当前页面下标
              debugPrint('page: $currentPage');
            },
            controller: PageController(
              initialPage: 1,//默认加载的页面下标，默认0
              keepPage: false,//是否记住页面下标，默认true
              viewportFraction: 0.5//页面可视大小，默认1.0占满
            ),
          ),
          // PageView.builder(itemBuilder: null,itemCount: 0),
    );
  }
}