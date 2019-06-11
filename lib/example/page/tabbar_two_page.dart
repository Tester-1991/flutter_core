import 'package:flutter/material.dart';

import 'package:flutter_core/example/widget/mytab.dart' as tab;

///tabbar演示
///石岩
///2019.06.10
class TabBarTwoPage extends StatefulWidget {
  @override
  _TabBarTwoPageState createState() => _TabBarTwoPageState();
}

class _TabBarTwoPageState extends State<TabBarTwoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["我的消息", "我的好友", "我的关注"];


  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: tab.TabBar(
          labelPadding: EdgeInsets.all(0.0),
          indicatorPadding: EdgeInsets.all(0.0),
          //生成Tab菜单
          controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
    );
  }
}
