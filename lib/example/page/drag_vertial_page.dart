import 'package:flutter/material.dart';
import 'package:flutter_core/example/widget/Drag.dart';
import 'package:flutter_core/example/widget/DragVertial.dart';

///拖拽组件
///石岩
///2019.06.04
class DragVertialPage extends StatefulWidget {
  @override
  _DragVertialPageState createState() => _DragVertialPageState();
}

class _DragVertialPageState extends State<DragVertialPage> {
  @override
  Widget build(BuildContext context) {
    return DragVertial();
  }
}
