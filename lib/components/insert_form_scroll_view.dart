import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'double_weight_text.dart';

class InsertFormScrollView extends StatelessWidget {
  InsertFormScrollView({
    this.counterField
  });

  final TextEditingController counterField;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
            child: DoubleWeightText(
                first: 'Quanto', second: ' você quer cobrar?'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
            child: TextField(
              style: TextStyle(fontSize: 24.0),
              controller: counterField,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '0.00'),
            ),
          ),
        ],
      ),
    );
  }
}