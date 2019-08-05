import 'package:flutter/material.dart';
import 'package:startup_namer/pages/AppBar.dart';
import 'package:startup_namer/pages/Button.dart';
import 'package:startup_namer/pages/CheckBox.dart';
import 'package:startup_namer/pages/Radio.dart';
import 'package:startup_namer/pages/TabController.dart';
import 'package:startup_namer/pages/TextFiled.dart';
import 'package:startup_namer/pages/User.dart';
import 'package:startup_namer/pages/login.dart';
import 'package:startup_namer/pages/register.dart';
import 'package:startup_namer/pages/search.dart';

import '../Tabs.dart';


//配置路由
final routes={
      '/':(context)=>Tabs(),
      '/search':(context,{arguments})=>SearchPage(arguments:arguments),
      '/register':(context,{arguments})=>Register(arguments:arguments),
      '/login':(context,{arguments})=>Login(arguments:arguments),
      '/appbar':(context)=>AppBarDemo(),
      '/tabController':(context)=>TabControllerPage(),
      '/user':(context)=>UserPage(),
      '/button':(context)=>ButtonPage(),
      '/textField':(context)=>TextFieldPage(),
      '/checkBox':(context)=>CheckBoxPage(),
      '/radio':(context)=>RadioPage(),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};