import 'package:flutter/material.dart';
///对于minWidth和minHeight来说，是取父子中相应数值较大的
///对于maxWidth和maxHeight来说，是取父子中相应数值较小的
class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 200.0, minHeight: 20.0,maxHeight: 600.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 20.0, minHeight: 200.0,maxHeight: 300.0),
                  child:Container(
                    color: Colors.red,
                    height: 500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
