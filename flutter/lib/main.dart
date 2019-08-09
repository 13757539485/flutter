import 'package:flutter/material.dart';
import 'package:startup_namer/routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dialog',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
