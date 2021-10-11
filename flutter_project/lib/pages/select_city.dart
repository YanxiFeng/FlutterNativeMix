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
      body: ListView.separated(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          cacheExtent: 40,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "Singapore1",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.check),
              contentPadding: EdgeInsets.fromLTRB(46, 0, 24, 0),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              indent: 46,
            );
          },
          itemCount: 8),
    );
  }
}
