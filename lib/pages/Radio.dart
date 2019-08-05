import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  RadioPage({Key key}) : super(key: key);

  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int _sex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('radio demo'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(
                groupValue: this._sex,
                value: 1,
                onChanged: (sex) {
                  setState(() {
                    this._sex = sex;
                  });
                },
              ),
              SizedBox(
                width: 15,
              ),
              Radio(
                groupValue: this._sex,
                value: 2,
                onChanged: (sex) {
                  setState(() {
                    this._sex = sex;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 80),
          RadioListTile(
            activeColor: Colors.pink,
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.alarm),
            groupValue: this._sex,
            value: 1,
            onChanged: (sex) {
              setState(() {
                this._sex = sex;
              });
            },
          ),
          SizedBox(
            width: 15,
          ),
          RadioListTile(
            activeColor: Colors.pink,
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.alarm),
            groupValue: this._sex,
            value: 2,
            onChanged: (sex) {
              setState(() {
                this._sex = sex;
              });
            },
          ),

          Switch(
            value: false,
            onChanged: (flag){

            },
          )
        ],
      ),
    );
  }
}
