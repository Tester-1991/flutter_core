import 'package:flutter/material.dart';
import 'package:flutter_core/example/widget/turn_box.dart';

class TurnBoxPage extends StatefulWidget {
  @override
  _TurnBoxPageState createState() => _TurnBoxPageState();
}

class _TurnBoxPageState extends State<TurnBoxPage> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              TurnBox(
                turns: _turns,
                speed: 500,
                child: Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ),
              TurnBox(
                turns: _turns,
                speed: 1000,
                child: Icon(
                  Icons.refresh,
                  size: 150.0,
                ),
              ),
              RaisedButton(
                child: Text("顺时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns += .2;
                  });
                },
              ),
              RaisedButton(
                child: Text("逆时针旋转1/5圈"),
                onPressed: () {
                  setState(() {
                    _turns -= .2;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
