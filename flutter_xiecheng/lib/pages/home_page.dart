import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_xiecheng/dao/home_dao.dart';
import 'package:flutter_xiecheng/dao/home_dao.dart' as prefix0;
import 'package:flutter_xiecheng/model/common_model.dart';
import 'package:flutter_xiecheng/model/grid_nav_model.dart';
import 'package:flutter_xiecheng/model/home_model.dart';
import 'package:flutter_xiecheng/model/sales_box_model.dart';
import 'package:flutter_xiecheng/widgets/grid_nav.dart';
import 'package:flutter_xiecheng/widgets/loading_container.dart';
import 'package:flutter_xiecheng/widgets/local_nav.dart';
import 'package:flutter_xiecheng/widgets/sales_box.dart';
import 'package:flutter_xiecheng/widgets/sub_nav.dart';
import 'package:flutter_xiecheng/widgets/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List<CommonModel> localNavList=[];
  List<CommonModel> bannerList=[];
  List<CommonModel> subNavList=[];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: this.isLoading,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              //用来移除ListView与状态栏之间的padding值，达到沉浸
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: NotificationListener(
                    child: _listView,
                    onNotification: (scrollNotification) {
                      if (scrollNotification
                              is ScrollUpdateNotification //过滤首次加载回调
                          &&
                          scrollNotification.depth == 0) {
                        //只监听第0个组件
                        _onScroll(scrollNotification.metrics.pixels);
                      }
                      return false; //设为true则消费事件，导致下拉不能刷新
                    },
                  )),
            ),
            _appBar
          ],
        ),
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

  Widget get _appBar {
    return Opacity(
      //用来修改透明度的组件
      opacity: this.appBarAlpha,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              '首页',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        LocalNav(localNavList: this.localNavList),
        GridNav(gridNavModel: this.gridNavModel),
        SubNav(subNavList: this.subNavList),
        SalesBox(salesBoxModel: this.salesBoxModel),
      ],
    );
  }

  Widget get _banner {
    return Container(
        height: 160,
        child: Swiper(
          //三方图片轮播组件
          itemCount: this.bannerList.length,
          autoplay: true, //自动播放
          itemBuilder: (context, index) {
            CommonModel model = bannerList[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(
                    title: model.title,
                    url: model.url,
                    statusBarColor: model.statusBarColor,
                    hideAppBar: model.hideAppBar,
                )));
              },
              child: Image.network(model.icon, fit: BoxFit.fill),
            );
          },
          pagination: SwiperPagination(), //添加指示器
        ),
      );
  }

  Future<Null> _handleRefresh() {
    HomeDao.fetch().then((result) {
      setState(() {
        this.localNavList = result.localNavList;
        this.subNavList = result.subNavList;
        this.gridNavModel = result.gridNav;
        this.salesBoxModel = result.salesBox;
        this.bannerList = result.bannerList;
        this.isLoading = false;
      });
    }).catchError((e) {
      print(e);
      setState(() {
        this.isLoading = false;
      });
    });
    return null;
  }
}
