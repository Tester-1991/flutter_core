import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/example/page/bottom_navigation_bar_page.dart';
import 'package:flutter_core/example/page/constrained_box_page.dart';
import 'package:flutter_core/example/page/custom_scroll_view_page.dart';
import 'package:flutter_core/example/page/drag_page.dart';
import 'package:flutter_core/example/page/drag_vertial_page.dart';
import 'package:flutter_core/example/page/gesture_detector_page.dart';
import 'package:flutter_core/example/page/gridview_page.dart';
import 'package:flutter_core/example/page/notification_listener_page.dart';
import 'package:flutter_core/example/page/notification_page.dart';
import 'package:flutter_core/example/page/pointer_page.dart';
import 'package:flutter_core/example/page/scale_animation_page.dart';
import 'package:flutter_core/example/page/stagger_animation_page.dart';
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

  List<String> list = [
    "GridView组件",
    "Navigator动画演示",
    "ConstrainedBox基础使用",
    "BottomNavigatorBar打洞效果",
    "CustomScrollView组件",
    "NotificationListener使用",
    "Pointer使用",
    "GestureDetector使用",
    "拖拽控件使用",
    "DragVertial使用",
    "listview点击事件外部执行",
    "放大动画",
    "动画跳转到下一个页面",
    "交错动画",
  ];

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
        routes: {
          "gridview_page": (context) => GridViewPage(),
          "constrained_box_page": (context) => ConstrainedBoxPage(),
          "bottom_navigation_bar_page": (context) => BottomNavigationBarPage(),
          "custom_scroll_view_page": (context) => CustomScrollViewPage(),
          "notification_listener_page": (context) => NotificationListenerPage(),
          "pointer_page": (context) => PointerPage(),
          "gesture_detector_page": (context) => GestureDetectorPage(),
          "drag_page": (context) => DragPage(),
          "drag_vertial_page": (context) => DragVertialPage(),
          "notification_page": (context) => NotificationPage(),
          "scale_animation_page": (context) => ScaleAnimationPage(),
          "stagger_animation_page": (context) => StaggerAnimationPage(),
        },

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
            child: Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(context, "gridview_page");
                            break;
                          case 1:
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (BuildContext context, _, __) {
                                      return Center(
                                          child: Text('My PageRoute'));
                                    },
                                    transitionsBuilder: (___,
                                        Animation<double> animation,
                                        ____,
                                        Widget child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: RotationTransition(
                                          turns: Tween<double>(
                                                  begin: 0.5, end: 1.0)
                                              .animate(animation),
                                          child: child,
                                        ),
                                      );
                                    }));
                            break;
                          case 2:
                            Navigator.pushNamed(
                                context, "constrained_box_page");
                            break;
                          case 3:
                            Navigator.pushNamed(
                                context, "bottom_navigation_bar_page");
                            break;
                          case 4:
                            Navigator.pushNamed(
                                context, "custom_scroll_view_page");
                            break;
                          case 5:
                            Navigator.pushNamed(
                                context, "notification_listener_page");
                            break;
                          case 6:
                            Navigator.pushNamed(context, "pointer_page");
                            break;
                          case 7:
                            Navigator.pushNamed(
                                context, "gesture_detector_page");
                            break;
                          case 8:
                            Navigator.pushNamed(context, "drag_page");
                            break;
                          case 9:
                            Navigator.pushNamed(context, "drag_vertial_page");
                            break;
                          case 10:
                            Navigator.pushNamed(context, "notification_page");
                            break;
                          case 11:
                            Navigator.pushNamed(
                                context, "scale_animation_page");
                            break;
                          case 12:
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: CustomScrollViewPage(),
                                  );
                                },
                              ),
                            );
                            break;
                          case 13:
                            Navigator.pushNamed(
                                context, "stagger_animation_page");
                            break;
                        }
                      },
                      child: ListTile(
                        title: Text(list[index]),
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        }));
  }
}
