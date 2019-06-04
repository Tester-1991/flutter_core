import 'package:flutter/material.dart';

///拖拽
///石岩
///2019.06.04
class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails details) {
                  print("用户手指按下:${details.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                    _left += details.delta.dx;
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  print(details.velocity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
