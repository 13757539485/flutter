import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:startup_namer/entity/post.dart';

const HTTP_URL = 'https://resources.ninghao.net/demo/posts.json';

class HttpPage extends StatefulWidget {
  HttpPage({Key key}) : super(key: key);

  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("正在加载..."),
            );
          }
          
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.author),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl)));
            }).toList(),
          );
        },
      ),
    );
  }

  Future<List<Posts>> fetchPosts() async {
    http.Response response = await http.get(HTTP_URL);
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      return Post.fromJson(decode).posts;
    } else {
      throw Exception('fetch post exception');
    }
  }
}
