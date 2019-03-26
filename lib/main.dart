import 'package:flutter/material.dart';
import 'package:flutter_core/example/easyrefresh.dart';
import 'package:flutter_core/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(MyStateApp());
}

ValueChanged<Locale> localeChange;

class MyStateApp extends StatefulWidget {
  @override
  _MyStateAppState createState() => _MyStateAppState();
}

class _MyStateAppState extends State<MyStateApp> {
  Locale _locale = const Locale('en', '');

  @override
  void initState() {
    super.initState();

    localeChange = (locale) {
      setState(() {
        _locale = locale;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue, canvasColor: Colors.transparent // 透明
            ),

        ///本地代理
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],

        ///支持的语言
        supportedLocales: S.delegate.supportedLocales,

        ///系统语言环境改变回调
        localeResolutionCallback: S.delegate.resolution(
          fallback: const Locale('zh'),
        ),
        home: Builder(builder: (context) {
          return Localizations.override(
            context: context,
            locale: _locale,
            child: ASEasyRefresh(),
          );
        }));
  }
}
