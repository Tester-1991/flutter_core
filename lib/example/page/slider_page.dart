import 'package:flutter/material.dart';

///滑块
///石岩
///2019.06.11
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            padding: EdgeInsets.all(0.0),
            color: Colors.yellow,
            child: Center(
              child: Slider(
                value: this.progress,
                max: 100.0,
                onChanged: (progress) {
                  debugPrint("progress:$progress");
                  setState(() {
                    this.progress = progress;
                  });
                },
                activeColor: Colors.black,
                inactiveColor: Colors.red,
                label: "111111111",
                divisions: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
