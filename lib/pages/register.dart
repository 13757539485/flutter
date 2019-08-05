import 'package:flutter/material.dart';

class Register extends StatelessWidget {

  final arguments;
  Register({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册界面'),
      ),
      body: Center(
        child: Text(
          '点击下一步跳转到登录界面',
          style: TextStyle(fontSize: 45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('下一步'),
        onPressed: (){
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
    );
  }
}
