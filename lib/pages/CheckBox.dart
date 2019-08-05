import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  CheckBoxPage({Key key}) : super(key: key);

  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('check box')),
      body: Column(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.pink[100],
            checkColor: Colors.white,
            value: this._flag,
            onChanged: (check) {
              setState(() {
                this._flag = check;
              });
            },
          ),
          CheckboxListTile(
            title: Text('标题'),
            subtitle: Text('二级标题'),
            value: this._flag,
            secondary: Icon(Icons.accessible,size: 30),
            selected: this._flag,
            onChanged: (check){
              setState(() {
                this._flag = check;
              });
            },
          )
        ],
      ),
    );
  }
}
