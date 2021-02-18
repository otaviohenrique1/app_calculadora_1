import 'package:app_calculadora/pages/calculadora_page.dart';
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
          RaisedButton(
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
          )
        ],
      ),
    );
  }
}
