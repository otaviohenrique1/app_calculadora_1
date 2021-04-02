import 'package:flutter/material.dart';
import 'dart:math';

class PerimetroCirculo extends StatefulWidget {
  @override
  _PerimetroCirculoState createState() => _PerimetroCirculoState();
}

class _PerimetroCirculoState extends State<PerimetroCirculo> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  final campoValorController = TextEditingController();
  String _valor = '0';
  String _campoVazio = "Campo vazio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perimetro do Circulo'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Valor",
                ),
                controller: campoValorController,
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazio;
                  }
                },
                onSaved: (value) {
                  _formData["campo_valor"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resultado:',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    _calcular();
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    _resetForm();
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: Text(
                    'Limpar',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    _ajuda(context);
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: Text(
                    'Ajuda',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _calcular() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      num campoValorRaio = num.parse(_formData['campo_valor']);
      num resultado = 2 * pi * campoValorRaio;
      String resultadoFormatado = resultado.toStringAsFixed(2);
      String resultadoArredondado = resultado.round().toString();
      setState(() {
        _valor =
            '$campoValorRaio -> $resultadoFormatado -> $resultadoArredondado';
        campoValorController.text = '';
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
          'P=2*pi*r',
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
    });
    _formKey.currentState.reset();
  }
}
