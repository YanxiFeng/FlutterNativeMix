import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() {
  CustomFlutterBinding();
  runApp(MyApp());
}

/// 错误为空界面
class WrongRouterWidget extends StatelessWidget {
  const WrongRouterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chope App',
      home: Scaffold(
        body: Center(
          child: Text('Route not found!'),
        ),
      ),
    );
  }
}

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'test': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => WrongRouterWidget());
    },

    ///透明弹窗页面
    'dialogPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(

          ///透明弹窗页面这个需要是false
          opaque: false,

          ///背景蒙版颜色
          barrierColor: Colors.black12,
          settings: settings,
          pageBuilder: (_, __, ___) => WrongRouterWidget());
    },
  };

  _MyAppState();

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }

    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}
