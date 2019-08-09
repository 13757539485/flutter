import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Form(
            key: registerFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '用户名', helperText: ''),
                  onEditingComplete: () {
                    //按回车调用
                  },
                  onFieldSubmitted: (value) {
                    //按回车调用
                  },
                  onSaved: (value) {
                    this.username = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return '不能为空';
                    }
                    return null;
                  },
                  autovalidate: this.autoValidate,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: '密码', helperText: ''),
                  onSaved: (value) {
                    this.password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return '不能为空';
                    }
                    return null;
                  },
                  autovalidate: this.autoValidate,
                ),
                RaisedButton(
                    child: Text('提交'),
                    onPressed: () {
                      if (registerFormKey.currentState.validate()) {
                        registerFormKey.currentState.save();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('正在提交信息...'),
                          duration: Duration(milliseconds: 500),
                        ));
                      } else {
                        setState(() {
                          this.autoValidate = true;
                        });
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
