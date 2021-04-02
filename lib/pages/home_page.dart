import 'package:app_calculadora/pages/calculadora_page.dart';
import 'package:app_calculadora/pages/perimetro_circulo.dart';
import 'package:app_calculadora/pages/teorema_pitagoras_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                'Calculadora',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculadoraPage(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                'Teorema de Pitagoras',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeoremaPitagorasPage(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                'Perimetro do Circulo',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerimetroCirculo(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
