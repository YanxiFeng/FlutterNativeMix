import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePageScreen extends StatefulWidget {
  @override
  _SimplePageScreenState createState() => _SimplePageScreenState();
}

class _SimplePageScreenState extends State<SimplePageScreen> {
  String _text = "xxx";

  ///声明一个用来存回调的对象
  VoidCallback nativeListener;

  @override
  void initState() {
    super.initState();

    ///添加事件响应者,监听native发往flutter端的事件
    nativeListener = BoostChannel.instance.addEventListener("NativeEventKey",
        (key, arguments) {
      setState(() {
        _text = key + " : " + arguments["msg"];
      });
      return;
    });
  }

  @override
  void dispose() {
    nativeListener.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单 Flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_text),
            // 1. 从Flutter页面打开一个Native页面，并处理返回结果
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.blueAccent,
                  child: Text(
                    'Open native page',
                    style: TextStyle(fontSize: 22.0, color: Colors.white),
                  )),
              onTap: () => BoostNavigator.instance
                  .push("ProfileViewController") // Native页面路由
                  .then((value) => print('retval:$value')),
            ),
          ],
        ),
      ),
    );
  }
}
