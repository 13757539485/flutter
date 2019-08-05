import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(
        child: Text(
          '首页',
          style: TextStyle(fontSize: 45),
        ),
        color: Theme.of(context).accentColor,
        textTheme: ButtonTextTheme.primary,
        onPressed: () {
          Navigator.pushNamed(context, '/search',
              arguments: {'id': 124, 'title': 'title'});
        },
      ),
      RaisedButton(
        child: Text(
          '自定义TabController',
          style: TextStyle(fontSize: 45),
        ),
        color: Theme.of(context).accentColor,
        textTheme: ButtonTextTheme.primary,
        onPressed: () {
          Navigator.pushNamed(context, '/tabController');
        },
      )
    ]);
  }
}
