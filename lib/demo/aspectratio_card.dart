import 'package:flutter/material.dart';
import 'package:startup_namer/res/listData1.dart';

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
  List<Widget> _getData() {
    var map = listData.map((value) {
      return CustomView(
        value['imageUrl'],
        value['title'],
        value['description'],
        value['imageUrl'],
      );
    });
    return map.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getData(),
    );
  }
}

class CustomView extends StatelessWidget {
  String imgUrl;
  String title;
  String subTitle;
  String iconUrl;

  CustomView(this.imgUrl, this.title, this.subTitle, this.iconUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              this.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(this.iconUrl),
            ),
            title: Text(this.title),
            subtitle: Text(
              this.subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
