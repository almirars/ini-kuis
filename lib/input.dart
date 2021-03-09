import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.satuan,
  }) : super(key: key);

  final TextEditingController satuan;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Angka"),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: satuan,
      keyboardType: TextInputType.number,
    );
  }
}
