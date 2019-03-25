import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ASUrlLauncher extends StatefulWidget {
  @override
  _ASUrlLauncherState createState() => _ASUrlLauncherState();
}

class _ASUrlLauncherState extends State<ASUrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("UrlLauncher Example"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _launchPhone();
            },
            child: Text("拨打电话"),
          ),
          RaisedButton(
            onPressed: () {
              _launchBaidu();
            },
            child: Text("打开百度网址"),
          ),
        ],
      ),
    );
  }

  ///拨打电话
  void _launchPhone() async {
    var phone = "tel:15201438478";

    if (await canLaunch(phone)) {
      await launch(phone);
    }
  }

  ///打开百度
  void _launchBaidu() async {
    var address = "http://www.baidu.com";

    if (await canLaunch(address)) {
      await launch(address);
    }
  }
}
