import 'package:flutter/material.dart';
import 'package:startup_namer/res/listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Container(
              height: 180,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.black,
            ),
          )
        ]),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 180,
                  child: Image.network(
                      "https://www.itying.com/images/flutter/2.png",
                      fit: BoxFit.cover),
                )),
            Expanded(
                flex: 1,
                child: Container(
                    height: 180,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ListView(
                      children: <Widget>[
                        Container(
                            height: 85,
                            child: Image.network(
                                'https://www.itying.com/images/flutter/2.png',
                                fit: BoxFit.cover)),
                        SizedBox(height: 10),
                        Container(
                            height: 85,
                            child: Image.network(
                                'https://www.itying.com/images/flutter/3.png',
                                fit: BoxFit.cover))
                      ],
                    )))
          ],
        )
      ],
    );
  }
}
