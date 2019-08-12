import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;//具体显示的内容
  final bool isLoading;
  final bool cover;//是否覆盖页面

  const LoadingContainer(
      {Key key, @required this.isLoading, this.cover = false, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView
        : Stack(
            children: <Widget>[child, isLoading ? _loadingView : null],
          );
  }

  Widget get _loadingView {
    return Center(child: CircularProgressIndicator());
  }
}
