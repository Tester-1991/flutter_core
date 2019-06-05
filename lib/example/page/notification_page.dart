import 'package:flutter/material.dart';
import 'package:flutter_core/example/widget/listview_text.dart';

///通知
///石岩
///2019.06.04
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NotificationListener<MyNotification>(
          onNotification: (notification) {
            print("index:${notification.msg}");
            return true;
          },
          child: Builder(builder: (context) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return TextItemView(index);
              },
              itemCount: 20,
            );
          }),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
