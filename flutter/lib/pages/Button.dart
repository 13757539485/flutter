import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("按钮演示页面"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('普通按钮'),
                  onPressed: () {},
                ),
                SizedBox(width: 5),
                RaisedButton(
                  child: Text('颜色按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(width: 5),
                RaisedButton(
                  child: Text('阴影按钮'),
                  elevation: 20,
                  onPressed: () {
                    print("有阴影按钮");
                  },
                ),
                SizedBox(width: 5),
                RaisedButton.icon(
                    icon: Icon(Icons.search),
                    label: Text('图标按钮'),
                    // onPressed: null,则按钮不能点击
                    onPressed: () {})
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 400,
                  child: RaisedButton(
                    child: Text('宽高修改'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      child: Text('自适应按钮'),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('圆角按钮'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {}),
                Container(
                  height: 80,
                  child: RaisedButton(
                      child: Text('圆形按钮'),
                      splashColor: Colors.red,
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.white)),
                      onPressed: () {}),
                ),
                FlatButton(
                  child: Text("FlatButton"),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                OutlineButton(
                    child: Text("OutlineButton"),
                    //  color: Colors.red,  //没有效果
                    onPressed: () {})
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('登录'),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text('注册'),
                      onPressed: () {},
                    ),
                    MyButton(
                        text: "自定义按钮",
                        width: 120.0,
                        pressed: () {})
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

//自定义按钮组件

class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final double width;
  final double height;
  const MyButton(
      {this.text = '', this.pressed = null, this.width = 80, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      ),
    );
  }
}
