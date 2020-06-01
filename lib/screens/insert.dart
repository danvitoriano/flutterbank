import 'package:flutter/material.dart';
import 'package:flutterbank/components/insert_form_scroll_view.dart';
import 'package:flutterbank/models/charge.dart';
import 'package:flutterbank/screens/list.dart';

class Insert extends StatefulWidget {
  Insert({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final TextEditingController _counterField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: InsertFormScrollView(counterField: _counterField),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _setCharge(context),
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }

  void _setDialog(String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta!'),
          content: Text(s),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'))
          ],
        );
      },
    );
  }

  void _setCharge(BuildContext context) {
    final double valor = double.tryParse(_counterField.text);
    if (valor != null) {
      Charge(valor);
      _counterField.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return List(valor);
          },
        ),
      );
    } else {
      _setDialog('Valor Obrigatório');
    }
  }
}


