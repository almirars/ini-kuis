import 'package:flutter/material.dart';

class history extends StatelessWidget {
  const history({
    Key key,
    @required this.listViewItem,
    @required this.listViewItem1,
  }) : super(key: key);

  final List<String> listViewItem;
  final List<String> listViewItem1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: listViewItem.map((String value) {
        return Container(
            margin: EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyle(fontSize: 15),
            ));
      }).toList()),
    );
  }
}
