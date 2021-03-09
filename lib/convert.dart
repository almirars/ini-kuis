import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convert extends StatelessWidget {
  final Function convertHandler;
  Convert({Key key, @required this.convertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: convertHandler,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Konversi Satuan"),
      ),
    );
  }
}
