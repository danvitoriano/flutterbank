import 'package:flutter/material.dart';
import 'package:flutterbank/components/double_weight_text.dart';

class List extends StatefulWidget {
  final double valor;

  List(this.valor);

  @override
  State<StatefulWidget> createState() {
    try {
      return _ListState();
    } on Exception catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}

class _ListState extends State<List> {

  @override
  Widget build(BuildContext context) {

    final String _meuValor = widget.valor.toString();

    try {
      return Scaffold(
        appBar: AppBar(
          title: Text('Enviar Cobrança'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DoubleWeightText(
                    first: 'Envie a cobrança ',
                    second: 'ou mostre o código abaixo.'
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline5,
                        children: <TextSpan>[
                          TextSpan(text: 'R\$ '),
                          TextSpan(
                              text: _meuValor,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Image(
                    height: 100,
                    width: 100,
                    image: NetworkImage('https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$_meuValor'),
                  )
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Seu amigo pode usar a conta do FlutterBank ou qualquer outro banco para te pagar'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text('Enviar Cobrança'),
              onPressed: () => print('eae'),
            ),
          ),
        ],
      );
    } on Exception catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}


