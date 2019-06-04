import 'package:flutter/material.dart';

///Pointer事件
///石岩
///2019.06.04
class PointerPage extends StatefulWidget {
  @override
  _PointerPageState createState() => _PointerPageState();
}

class _PointerPageState extends State<PointerPage> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 150,
                  child: Text(
                    _event == null ? "" : _event.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPointerDown: (PointerDownEvent event) {
                  setState(() {
                    _event = event;
                  });
                },
                onPointerMove: (PointerMoveEvent event) {
                  setState(() {
                    _event = event;
                  });
                },
                onPointerUp: (PointerUpEvent event) {
                  setState(() {
                    _event = event;
                  });
                },
              ),
              Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                    child: Center(child: Text("Box A")),
                  ),
                  behavior: HitTestBehavior.opaque,
                  onPointerDown: (event) => print("down A")),
              Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                    child: Center(child: Text("Box A")),
                  ),
//                behavior: HitTestBehavior.opaque,
                  onPointerDown: (event) => print("down A")),
              Listener(
                child: Container(
                  width: 300.0,
                  height: 150.0,
                  color: Colors.red,
                  child: Center(child: Text("Box A")),
                ),
                behavior: HitTestBehavior.opaque,
                onPointerDown: (event) => print("down A"),
              ),
              Stack(
                children: <Widget>[
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.blue)),
                    ),
                    onPointerDown: (event) => print("down0"),
                  ),
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                      child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                    ),
                    onPointerDown: (event) => print("down1"),
                    behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                  ),
                ],
              ),
              Listener(
                child: AbsorbPointer(
                  child: Listener(
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                      height: 100.0,
                    ),
                    onPointerDown: (event) => print("in"),
                  ),
                ),
                onPointerDown: (event) => print("up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
