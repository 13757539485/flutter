import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/common_model.dart';
import 'package:flutter_xiecheng/model/grid_nav_model.dart';
import 'package:flutter_xiecheng/widgets/webview.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;

  const GridNav({Key key, @required this.gridNavModel}) : super(key: key);

//  const GridNav(this._gridNavModel,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: _gridNavItems(context),
        ),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }

  _gridNavItem(BuildContext context, GridNavItem item, bool isFirst) {
    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(int.parse('0xff' + item.startColor)),
        Color(int.parse('0xff' + item.endColor))
      ])),
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: _mainItem(context, item.mainItem)),
          Expanded(
              flex: 1, child: _doubleItem(context, item.item1, item.item2)),
          Expanded(flex: 1, child: _doubleItem(context, item.item3, item.item4))
        ],
      ),
    );
  }

  _mainItem(BuildContext context, CommonModel model) {
    return _wrapGestureDetector(
        context,
        model,
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.network(
              model.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(model.title,
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            )
          ],
        ));
  }

  _doubleItem(
      BuildContext context, CommonModel topModel, CommonModel bottomModel) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _wrapGestureDetector(
              context, topModel, _item(context, topModel, true)),
        ),
        Expanded(
            child: _wrapGestureDetector(
          context,
          bottomModel,
          _item(context, bottomModel, false),
        ))
      ],
    );
  }

  _item(BuildContext context, CommonModel model, bool isFirstItem) {
    BorderSide borderSide = BorderSide(color: Colors.white, width: 0.8);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              left: borderSide,
              bottom: isFirstItem ? borderSide : BorderSide.none),
        ),
        child: Center(
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }

  _wrapGestureDetector(BuildContext context, CommonModel model, Widget widget) {
    return GestureDetector(
      child: widget,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      title: model.title,
                      url: model.url,
                      hideAppBar: model.hideAppBar,
                      statusBarColor: model.statusBarColor,
                    )));
      },
    );
  }
}
