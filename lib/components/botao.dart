import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String labelBotao;
  final Color corBotao;
  final Color corTextoBotao;
  final dynamic onCallback;

  Botao(
      {Key key,
      this.labelBotao,
      this.corBotao,
      this.corTextoBotao,
      this.onCallback})
      : super(key: key);

  @override
  _BotaoState createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        widget.labelBotao,
        style: TextStyle(fontSize: 20),
      ),
      color: widget.corBotao,
      textColor: widget.corTextoBotao,
      onPressed: widget.onCallback,
    );
  }
}
