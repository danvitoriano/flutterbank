import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'FlutterBank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _message = '';

  void _incrementCounter() {
    setState(() {
      _message = '';
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _message = '';
      _counter--;
    });
  }

  void _displayMessage() {
    setState(() {
      _message = 'Cobrança de R\$ $_counter,00 enviada.';
      _counter = 0;
    });
    Timer(
        const Duration(milliseconds: 5000),
        () => setState(() {
              _message = '';
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline5,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Quanto',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' você quer cobrar?'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
              child: RichText(
                text: TextSpan(
                  text: 'R\$ ',
                  style: Theme.of(context).textTheme.headline5,
                  children: <TextSpan>[
                    TextSpan(
                        text: '$_counter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ',00'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Colors.lightGreen),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: _decrementCounter,
                          icon: Icon(Icons.remove))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Colors.lightGreen),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: _incrementCounter,
                          icon: Icon(Icons.add))),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: Text(
                    '$_message',
                    style: TextStyle(fontSize: 20, color: Colors.lightGreen),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayMessage,
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }
}
