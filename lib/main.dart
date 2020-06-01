import 'package:flutter/material.dart';
import 'package:flutterbank/screens/insert.dart';

void main() => runApp(FlutterBank());

class FlutterBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBank',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Insert(title: 'Cobrar'),
    );
  }
}

