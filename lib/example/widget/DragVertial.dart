import 'package:flutter/material.dart';

///拖拽
///石岩
///2019.06.04
class DragVertial extends StatefulWidget {
  @override
  _DragVertialState createState() => _DragVertialState();
}

class _DragVertialState extends State<DragVertial>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                //手指滑动时会触发此回调
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
