import 'package:flutter/material.dart';
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
                child: Text("Send Event to Native"))
          ],
        ),
      ),
    );
  }
}
