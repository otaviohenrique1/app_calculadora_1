import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  final String texto;
  Ajuda({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: Text('Ajuda'),
      content: Text(
        texto,
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
    );
  }
}
