import 'package:flutter/material.dart';

class TeoremaPitagorasPage extends StatefulWidget {
  @override
  _TeoremaPitagorasPageState createState() => _TeoremaPitagorasPageState();
}

class _TeoremaPitagorasPageState extends State<TeoremaPitagorasPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Image.asset('assets/triangulo_retangulo.png'),
          TextFormField(
            decoration: InputDecoration(labelText: "Cateto 1"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Cateto 2"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Hipotenusa"),
          ),
        ],
      ),
    );
  }
}
