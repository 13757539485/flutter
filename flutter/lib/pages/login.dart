import 'package:flutter/material.dart';
import 'package:startup_namer/routes/Routes.dart';

import '../Tabs.dart';

class Login extends StatelessWidget {
  final arguments;
  Login({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆界面'),
      ),
      body: Center(
        child: Text(
          '点击确定返回首页',
          style: TextStyle(fontSize: 45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('确定'),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Tabs(index:1)),
              (routes) => routes == null);
        },
      ),
    );
  }
}
