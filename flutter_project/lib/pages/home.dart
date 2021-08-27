import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_project/pages/simple.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  ///声明一个用来存回调的对象
  VoidCallback nativeListener;
  String _text = "text";

  @override
  void initState() {
    super.initState();

    ///添加事件响应者,监听native发往flutter端的事件
    nativeListener = BoostChannel.instance.addEventListener("NativeEventKey",
        (key, arguments) {
      _text = key;
      return;
    });
  }

  @override
  void dispose() {
    super.dispose();
    nativeListener.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BoostNavigator.instance.pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("首页 Flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_text),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SimplePageScreen()));
                },
                child: Icon(Icons.book_online)),
            ElevatedButton(
                onPressed: () {
                  // 发送事件给native
                  BoostChannel.instance.sendEventToNative(
                      "FlutterEventToNative", {"key1": "value1"});
                },
                child: Icon(Icons.accessibility_new))
          ],
        ),
      ),
    );
  }
}
