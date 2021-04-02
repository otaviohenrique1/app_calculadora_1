import 'dart:math';

import 'package:flutter/material.dart';

class TeoremaPitagorasPage extends StatefulWidget {
  @override
  _TeoremaPitagorasPageState createState() => _TeoremaPitagorasPageState();
}

class _TeoremaPitagorasPageState extends State<TeoremaPitagorasPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  String _valor = '0';
  String _campoVazio = "Campo vazio";
  String _resultadoLabel = 'Resultado:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teorema de Pitagoras'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            // Image.asset('assets/triangulo_retangulo.png'),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Cateto 1"),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazio;
                  }
                },
                onSaved: (value) {
                  _formData["cateto_1"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Cateto 2"),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazio;
                  }
                },
                onSaved: (value) {
                  _formData["cateto_2"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Hipotenusa"),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazio;
                  }
                },
                onSaved: (value) {
                  _formData["hipotenusa"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _resultadoLabel,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$_valor',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('Calcular'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      _calcular();
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Limpar'),
                    onPressed: () {
                      _resetForm();
                    },
                  ),
                  RaisedButton(
                    child: Text('Ajuda'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      _ajuda(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _calcular() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String nomeCampo = '';
      num cateto1 = num.parse(_formData['cateto_1']);
      num cateto2 = num.parse(_formData['cateto_2']);
      num hipotenusa = num.parse(_formData['hipotenusa']);
      num resultado = 0;

      if (cateto1 == 0) {
        resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
        nomeCampo = 'Cateto 1';
      } else if (cateto2 == 0) {
        nomeCampo = 'Cateto 2';
        resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      } else if (hipotenusa == 0) {
        nomeCampo = 'Hipotenusa';
        resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      } else {
        nomeCampo = '';
        resultado = 0;
      }

      String resultadoFormatado = resultado.toStringAsFixed(2);
      String resultadoArredondado = resultado.round().toString();
      setState(() {
        _resultadoLabel = 'Resultado: $nomeCampo';
        _valor = '$resultado -> $resultadoFormatado -> $resultadoArredondado';
        return _valor;
      });
    }
  }

  _ajuda(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text('Ajuda'),
        content: Text(
          'Hipotenusa^2=Cateto1^2+Cateto2^2',
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              'Fechar',
            ),
          )
        ],
      ),
    );
  }

  _resetForm() {
    setState(() {
      _valor = "0";
      _resultadoLabel = 'Resultado:';
    });
    _formKey.currentState.reset();
  }
}
