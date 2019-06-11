import 'package:flutter/material.dart';

import 'package:flutter_core/example/widget/mytab.dart' as tab;

///tabbar演示
///石岩
///2019.06.10
class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["数学", "英语", "化学","物理","政治","经济","体育"];

  List<Widget> list = [];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    setIndicator();
  }

  void setIndicator() {
    list.clear();

    for (int i = 0; i < tabs.length; i++) {
      var widget = Container(
        height: 40,
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(tabs[i]),
            ),
            Positioned(
              left: 5.0,
              right: 5.0,
              bottom: 0.0,
              child: Offstage(
                child: Image.asset(
                  "assets/images/2.0x/tab.png",
                  fit: BoxFit.cover,
                  height: 3,
                ),
                offstage: !(currentIndex == i),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: Container(
                width: double.infinity,
                height: 5.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
      list.add(widget);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {
            debugPrint("index:$index");

            currentIndex = index;

            setIndicator();
          },
          labelPadding: EdgeInsets.all(0.0),
          indicatorPadding: EdgeInsets.all(0.0),
          //生成Tab菜单
          controller: _tabController,
          tabs: list,
          indicator: BoxDecoration(),
          indicatorWeight: 0.0,
        ),
      ),
    );
  }
}
