import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _imgUrl = [
    'https://www.itying.com/images/flutter/1.png',
    'https://www.itying.com/images/flutter/2.png',
    'https://www.itying.com/images/flutter/3.png',
  ];
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            //用来移除ListView与状态栏之间的padding值，达到沉浸
            removeTop: true,
            context: context,
            child: NotificationListener(
              //监听滚动
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      //三方图片轮播组件
                      itemCount: this._imgUrl.length,
                      autoplay: true, //自动播放
                      itemBuilder: (context, index) {
                        return Image.network(this._imgUrl[index],
                            fit: BoxFit.fill);
                      },
                      pagination: SwiperPagination(), //添加指示器
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('占位'),
                    ),
                  )
                ],
              ),
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification //过滤首次加载回调
                    &&
                    scrollNotification.depth == 0) {
                  //只监听第0个组件
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return true;
              },
            ),
          ),
          Opacity(//用来修改透明度的组件
            opacity: this.appBarAlpha,
            child: Container(
              height: 80,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll(double pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      this.appBarAlpha = alpha;
    });
  }
}
