import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectCityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => {Navigator.pop(context, false)},
        ),
        title: Text("Select City"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 40.0),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 30,
              color: Colors.greenAccent,
              child: Center(
                  child: Text(
                'index:$index',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
            );
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
