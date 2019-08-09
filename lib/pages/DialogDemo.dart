import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('是否关闭弹框?'),
            title: Text('弹框选择'),
            actions: <Widget>[
              FlatButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展示弹窗'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('alert dialog'),
              onPressed: _showAlertDialog,
            ),
            MySnackBar()
          ],
        ),
      ),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return RaisedButton(
            child: Text('snack bar'),
            onPressed: () {
              SnackBar snackBar = SnackBar(
                duration: Duration(seconds: 10),
                content: Text('显示snack bar内容'),
                action: SnackBarAction(
                  label: '关闭',
                  onPressed: () {
                    print('点击action');
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            });
      },
    );
  }
}
