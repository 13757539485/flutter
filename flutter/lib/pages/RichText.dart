import 'package:flutter/material.dart';

class RichTextPage extends StatelessWidget {
  const RichTextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich text'),
      ),
      body: RichText(
        text: TextSpan(
            text: '测试数据',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            children: [
              TextSpan(
                  text: 'baidu',
                  style: TextStyle(
                      backgroundColor: Colors.amber,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal))
            ]),
      ),
    );
  }
}
