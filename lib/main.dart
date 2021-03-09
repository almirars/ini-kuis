import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_satuan/history.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';
import 'textForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController satuan = new TextEditingController();

  double _inputSatuan = 0;
  double _result = 0;
  final inputController = TextEditingController();
  List<String> listItem = ["Kg", "Hg", "Dag", "G", "Dg", "Cg", "Mg"];
  List<String> listItem1 = ["Kg", "Hg", "Dag", "G", "Dg", "Cg", "Mg"];
  List<String> listViewItem = List<String>();
  List<String> listViewItem1 = List<String>();
  String _newValue = "Kg";
  String _newValue1 = "Kg";

  void hitung() {
    setState(() {
      _inputSatuan = double.parse(satuan.text);
      if (_newValue == "Kg")
        _result = _inputSatuan * 10;
      else if (_newValue == "Hg")
        _result = _inputSatuan * 100;
      else if (_newValue == "Dag")
        _result = _inputSatuan * 1000;
      else if (_newValue == "G")
        _result = _inputSatuan * 10000;
      else if (_newValue == "Dg")
        _result = _inputSatuan * 100000;
      else if (_newValue == "Cg")
        _result = _inputSatuan * 1000000;
      else
        _result = (_inputSatuan * 10000000);
      listViewItem.add("$_newValue" ":" "$_result");
    });
  }

  void hitungLagi() {
    setState(() {
      _inputSatuan = double.parse(satuan.text);
      if (_newValue == "Kg")
        _result = _inputSatuan / 10;
      else if (_newValue == "Hg")
        _result = _inputSatuan / 100;
      else if (_newValue == "Dag")
        _result = _inputSatuan / 1000;
      else if (_newValue == "G")
        _result = _inputSatuan / 10000;
      else if (_newValue == "Dg")
        _result = _inputSatuan / 100000;
      else if (_newValue == "Cg")
        _result = _inputSatuan / 1000000;
      else
        _result = (_inputSatuan / 10000000);
      listViewItem1.add("$_newValue1" ":" "$_result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Satuan"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              textForm(inputController: satuan),
              Text(
                "Dari ",
                style: TextStyle(fontSize: 30),
              ),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    // hitung();
                  });
                },
              ),
              Text(
                "Ke ",
                style: TextStyle(fontSize: 30),
              ),
              DropdownButton<String>(
                items: listItem1.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue1,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue1 = changeValue;
                    // hitungLagi();
                  });
                },
              ),
              Result(result: _result),
              Convert(convertHandler: hitung),
              Convert(convertHandler: hitungLagi),
              // Container(
              //   margin: EdgeInsets.only(top: 10, bottom: 10),
              //   child: Text(
              //     "Riwayat Konversi",
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              // history(listViewItem: listViewItem, listViewItem1: listViewItem1),
            ],
          ),
        ),
      ),
    );
  }
}
