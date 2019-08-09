import 'package:flutter/material.dart';

class RefreshIndicatorPage extends StatefulWidget {
  RefreshIndicatorPage({Key key}) : super(key: key);

  _RefreshIndicatorPageState createState() => _RefreshIndicatorPageState();
}

class _RefreshIndicatorPageState extends State<RefreshIndicatorPage> {
  List<String> cities = [
    '池州',
    '合肥',
    '淮北',
    '淮南',
    '六安',
    '龙岩',
    '宁德',
    '泉州',
    '三明',
    '厦门',
    '安顺',
    '铜仁',
    '遵义',
    '清镇',
    '毕节'
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        addMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void addMoreData() {
    List<String> more = List.from(cities);
    more.addAll(cities);
    setState(() {
      this.cities = more;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新上拉加载'),
      ),
      body: RefreshIndicator(
        child: ListView(
          controller: this._scrollController,
          children: cities.map((value) {
            return Container(
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                value,
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
        ),
        onRefresh: () async {
          setState(() {
            this.cities = this.cities.reversed.toList();
          });
        },
      ),
    );
  }
}
