import 'package:flutter/material.dart';
import 'package:startup_namer/res/listData.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('你好'),
            // pinned: true,//表示sliverappbar固定
            floating: true,//想下滑动会立马出现
          ),
          SliverSafeArea(
            //使用后不会沉浸
            sliver: SliverPadding(
              //设置边距
              padding: EdgeInsets.all(8),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            listData[index]['imageUrl'],
            fit: BoxFit.cover,
          ),
        );
      }, childCount: listData.length),
    );
    // SliverGrid.count();
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    listData[index]['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(listData[index]['title'],
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      Text(listData[index]['author'],
                          style: TextStyle(fontSize: 13, color: Colors.white))
                    ],
                  ),
                )
                // Positioned.fill(
                //   child: Material(
                //     color: Colors.transparent,
                //     child: InkWell(
                //       splashColor: Colors.white.withOpacity(0.3),
                //       highlightColor: Colors.white.withOpacity(0.1),
                //       onTap: (){
                //         print('tap');
                //       },
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      }, childCount: listData.length),
    );
    // SliverGrid.count();
  }
}
