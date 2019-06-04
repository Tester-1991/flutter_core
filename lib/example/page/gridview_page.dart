import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        children: <Widget>[
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
            width: 400,
            height: 200,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "http://sc.jb51.net/uploads/allimg/141014/10-141014211512141.jpg",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
