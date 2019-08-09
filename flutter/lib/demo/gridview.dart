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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }

  Widget _getListData(context, i) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 1),
        ),
        child: Column(
          children: <Widget>[
            Image.network(listData[i]['imageUrl']),
            SizedBox(height: 12),
            Text(
              listData[i]['title'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
          ],
        ));
  }
}
