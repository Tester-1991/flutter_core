import 'package:flutter/material.dart';
import 'package:flutter_core/example/page/notification_page.dart';

class TextItemView extends StatefulWidget {
  int index;

  @override
  _TextItemViewState createState() => _TextItemViewState();

  TextItemView(this.index);
}

class _TextItemViewState extends State<TextItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyNotification("${widget.index}").dispatch(context);
      },
      child: Container(
        height: 80,
        child: Center(
          child: Text(
            "小明",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
