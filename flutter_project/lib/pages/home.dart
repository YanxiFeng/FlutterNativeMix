import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_project/pages/simple.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String _text = "Push -> Simple(Flutter)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // pop到native，发送消息给natvie
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
                child: Text(_text)),
            ElevatedButton(
                onPressed: () {
                  // 发送事件给native
                  BoostChannel.instance.sendEventToNative(
                      "FlutterEventToNative", {"name": "Jason"});
                },
                child: Text("Send Event to Native")),
            ElevatedButton(
                onPressed: () {
                  _requestDatasFromNative();
                },
                child: Text("Flutter method channel"))
          ],
        ),
      ),
    );
  }

  // 向native发送数据，并获取native返回的数据
  _requestDatasFromNative() async {
    String response = await MethodChannel("chope_flutter_method_channel")
        .invokeMethod("profile.notification.page_init");
    setState(() {
      _text = response;
    });
  }
}
