import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';

class HomePageScreen extends StatelessWidget {
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
        child: Text("home"),
      ),
    );
  }
}
