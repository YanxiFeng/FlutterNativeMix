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
            return Column(
              children: [
                Row(
                  children: [Text("Shanghai"), Icon(Icons.check)],
                ),
              ],
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
