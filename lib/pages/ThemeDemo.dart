import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(//完全覆盖主题

        ),
        // data: Theme.of(context).copyWith(),//此处定义的覆盖
        child: null,
      ),
    );
  }
}
