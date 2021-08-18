import 'package:flutter/material.dart';

class SimplePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单"),
      ),
      body: Center(
        child: Text("simple"),
      ),
    );
  }
}
