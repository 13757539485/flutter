import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var _textContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._textContent.text = '默认值';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField demo'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                controller: _textContent,
                onChanged: (text) {},
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity, //自适应宽度
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('清除内容'),
                  onPressed: () {
                    this._textContent.clear();
                    //this._textContent.text获取内容
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class TextFieldTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TextField(
            cursorColor: Colors.pink,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'hint文字'),
            textAlign: TextAlign.end,
            cursorColor: Colors.pink,
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: '多行密码'),
            cursorColor: Colors.pink,
            maxLines: 2,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: '用户名',
              labelStyle: TextStyle(fontSize: 20),
            ),
            cursorColor: Colors.pink,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              contentPadding: EdgeInsets.only(right: 20),
              helperText: '提示的文字',
              prefixIcon: Icon(Icons.adb),
              suffixIcon: Icon(Icons.settings),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            cursorColor: Colors.pink,
          )
        ],
      ),
    );
  }
}
