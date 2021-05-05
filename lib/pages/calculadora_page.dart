import 'package:app_calculadora/components/ajuda.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  String _valor = '0';
  final campoNomeController = TextEditingController();
  final campoBController = TextEditingController();
  String _campoVazioMensagem = "Campo vazio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                controller: campoNomeController,
                keyboardType: TextInputType.text,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazioMensagem;
                  }
                },
                onSaved: (value) {
                  _formData["nome"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Campo A'),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazioMensagem;
                  }
                },
                onSaved: (value) {
                  _formData["campo_a"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Campo B'),
                controller: campoBController,
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazioMensagem;
                  }
                },
                onSaved: (value) {
                  _formData["campo_b"] = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Campo C'),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return _campoVazioMensagem;
                  }
                },
                onSaved: (value) {
                  _formData["campo_c"] = value;
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
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                    // color: Colors.blue,
                    // textColor: Colors.white,
                    onPressed: () {
                      _calcular();
                    },
                  ),
                  ElevatedButton(
                    // color: Colors.red,
                    // textColor: Colors.white,
                    child: Text(
                      'Limpar',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _resetForm();
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Ajuda',
                      style: TextStyle(fontSize: 20),
                    ),
                    // color: Colors.green,
                    // textColor: Colors.white,
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
      String nome = _formData['nome'];
      num campoA = num.parse(_formData['campo_a']);
      num campoB = num.parse(_formData['campo_b']);
      num campoC = num.parse(_formData['campo_c']);

      num resultado = (campoB * campoC) / campoA;
      String resultadoFormatado = resultado.toStringAsFixed(2);
      String resultadoArredondado = resultado.round().toString();

      setState(() {
        _valor =
            '$nome -> $campoB -> $resultadoFormatado -> $resultadoArredondado';
        campoNomeController.text = '';
        campoBController.text = '';
        return _valor;
      });
    }
  }

  _ajuda(BuildContext context) {
    showDialog(
      builder: (context) => Ajuda(
        texto: '''
          A----B
          C----X
          X=(B*C)/A''',
      ),
      context: context,
    );
  }

  _resetForm() {
    setState(() {
      _valor = "0";
    });
    _formKey.currentState.reset();
  }
}
