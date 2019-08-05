import 'package:flutter/material.dart';
import 'package:startup_namer/routes/Routes.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {'/search': (context) => SearchPage()},
//       home: Tabs(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/radio',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
