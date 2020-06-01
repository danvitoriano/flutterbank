import 'package:flutter/material.dart';

class DoubleWeightText extends StatelessWidget {
  final String first;
  final String second;

  DoubleWeightText({this.first, this.second});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.headline5,
        children: <TextSpan>[
          TextSpan(
            text: first,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: second),
        ],
      ),
    );
  }
}
