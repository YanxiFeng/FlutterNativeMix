import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单 Flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("data"),
            // 1. 从Flutter页面打开一个Native页面，并处理返回结果
            InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.yellow,
                  child: Text(
                    'open native page',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  )),
              onTap: () => BoostNavigator.instance
                  .push("ProfileViewController") // Native页面路由
                  .then((value) => print('retval:$value')),
            ),

            ElevatedButton(
                onPressed: () {
                  BoostNavigator.instance.push("name");
                },
                child: Icon(Icons.access_alarm))
          ],
        ),
      ),
    );
  }
}
