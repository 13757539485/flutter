import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {
  const DecorationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoration Test'),
      ),
      body: Container(
        height: 100,
        width: 100,
        child: Icon(
          Icons.label,
          size: 32,
        ),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image:
          //       NetworkImage('https://www.itying.com/images/flutter/2.png'),
          //   fit: BoxFit.cover,
          //   alignment: Alignment.center,
          //   colorFilter: ColorFilter.mode(
          //       Colors.indigoAccent[400], BlendMode.hardLight), //颜色滤镜：颜色，混合模式
          //   // repeat: ImageRepeat.noRepeat
          // ),
          // border: Border(
          //   top: BorderSide(
          //       color: Colors.black, width: 3, style: BorderStyle.solid),
          //   left: BorderSide(
          //       color: Colors.black, width: 3, style: BorderStyle.solid),
          //   bottom: BorderSide(
          //       color: Colors.black, width: 3, style: BorderStyle.solid),
          //   right: BorderSide(
          //       color: Colors.black, width: 3, style: BorderStyle.solid),
          // ),
          border: Border.all(
              color: Colors.black, width: 3, style: BorderStyle.solid),
          // gradient: RadialGradient(
          //   colors: [
          //     Colors.blue,
          //     Colors.red,
          //     Colors.yellow
          //   ],
          // )
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.red, Colors.yellow],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight),
          // shape: BoxShape.circle,//形状
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                offset: Offset(6, 7),//偏移位置
                color: Colors.grey,
                blurRadius: 3,//模糊程度
                spreadRadius: -2//扩散大小
                )
          ],
          // borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
