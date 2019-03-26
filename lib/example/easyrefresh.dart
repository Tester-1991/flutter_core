import 'package:flutter/material.dart';
import 'package:flutter_core/example/image_page.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';

///https://pub.dartlang.org/packages/flutter_easyrefresh#-readme-tab-
///下拉刷新 上拉加载更多
class ASEasyRefresh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ASEasyRefreshState();
  }
}

class _ASEasyRefreshState extends State<ASEasyRefresh> {
  ///刷新key
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();

  ///头部key
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();

  ///底部key
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  var count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("EasyRefresh Example"),
        ),
        body: EasyRefresh(
          key: _easyRefreshKey,
          limitScroll: true,
          autoControl: true,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: InkWell(
                  child: Text("第$index项"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TestImage();
                    }));
                  },
                ),
              );
            },
            itemCount: count,
          ),
          autoLoad: false,
          firstRefresh: false,
          refreshHeader: MaterialHeader(
            key: _headerKey,
            backgroundColor: Colors.white,
          ),
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            bgColor: Colors.blue,
            loadText: "上拉加载",
            loadReadyText: "释放加载",
            loadingText: "正在加载",
            loadedText: "加载结束",
            noMoreText: "没有更多数据",
            moreInfo: "更新于 %T",
          ),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {});
          },
          loadMore: () async {
            await Future.delayed(Duration(seconds: 2), () {
              setState(() {
                count = 30;
              });
            });
          },
        ));
  }
}
