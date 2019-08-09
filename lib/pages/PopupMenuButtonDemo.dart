import 'package:flutter/material.dart';

class PopupMenuButtonPage extends StatelessWidget {
  const PopupMenuButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: '描述主页',
              child: Text('主页'),
            ),
            PopupMenuItem(
              value: '描述搜索',
              child: Text('搜索'),
            ),
            PopupMenuItem(
              value: '描述我的',
              child: Text('我的'),
            )
          ],
          onSelected: (value) {
          },
          onCanceled: (){
          },
        ),
      ),
    );
  }
}
