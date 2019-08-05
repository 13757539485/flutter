import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(
            '注册',
            style: TextStyle(fontSize: 45),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/register');
          },
        ),
        RaisedButton(
          child: Text(
            '登录',
            style: TextStyle(fontSize: 45),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
          },
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
