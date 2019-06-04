import 'package:flutter/material.dart';
import 'package:flutter_core/example/widget/Drag.dart';

///拖拽组件
///石岩
///2019.06.04
class DragPage extends StatefulWidget {
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  @override
  Widget build(BuildContext context) {
    return Drag();
  }
}
