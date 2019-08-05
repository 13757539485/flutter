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
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: _getListData,
    );
  }

  Widget _getListData(context, index) {
      return ListTile(
        title: Text(listData[index]['title']),
        subtitle: Text(listData[index]['author']),
        leading: Image.network(listData[index]['imageUrl']),
      );
    }
}
