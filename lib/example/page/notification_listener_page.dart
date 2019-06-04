import 'package:flutter/material.dart';

///NotificationListener
///石岩
///2019.06.03
class NotificationListenerPage extends StatefulWidget {
  @override
  _NotificationListenerPageState createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              debugPrint("当前滚动位置:${notification.metrics.pixels}");
              debugPrint("最大滚动长度:${notification.metrics.maxScrollExtent}");
              debugPrint("划出屏幕上方的列表长度:${notification.metrics.extentBefore}");
              debugPrint("屏幕显示的列表部分的长度:${notification.metrics.extentInside}");
              debugPrint("列表底部未显示到屏幕范围部分的长度:${notification.metrics.extentAfter}");
              debugPrint("列表顶或底部:${notification.metrics.atEdge}");
              //重新构建
              //重新构建
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
              return false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ListView.builder(
                    itemCount: 100,
                    itemExtent: 50.0,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("$index"));
                    }),
                CircleAvatar(
                  //显示进度百分比
                  radius: 30.0,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
