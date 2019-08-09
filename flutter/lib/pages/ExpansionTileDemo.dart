import 'package:flutter/material.dart';

const CITY_NAMES = {
  '安徽省': ['池州', '合肥', '淮北', '淮南', '六安'],
  '福建省': ['龙岩', '宁德', '泉州', '三明', '厦门'],
  '贵州省': ['安顺', '铜仁', '遵义', '清镇', '毕节'],
};

class ExpansionTilePage extends StatefulWidget {
  ExpansionTilePage({Key key}) : super(key: key);

  _ExpansionTilePageState createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _buildChilds(),
      ),
    );
  }

  List<Widget> _buildChilds() {
    List<Widget> widgets = List();
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_getItem(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _getItem(String city, List<String> subCiry) {
    return ExpansionTile(
      title: Text(city),
      backgroundColor: Colors.white,
      leading: Icon(Icons.accessible),
      initiallyExpanded: true,
      trailing: Icon(Icons.arrow_right),
      onExpansionChanged: (bool) {}, //监听是否展开
      children: subCiry.map((value) {
        return FractionallySizedBox(
          widthFactor: 1,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
