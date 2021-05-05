import 'package:flutter/material.dart';

class CampoFormulario extends StatefulWidget {
  final String labelCampo;
  final dynamic onCallback;
  final TextInputType keyboardType;
  final String mensagemCampo;

  CampoFormulario(
      {Key key,
      this.labelCampo,
      this.mensagemCampo,
      this.keyboardType,
      this.onCallback})
      : super(key: key);

  @override
  _CampoFormularioState createState() => _CampoFormularioState();
}

class _CampoFormularioState extends State<CampoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: widget.labelCampo),
        keyboardType: widget.keyboardType,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return widget.mensagemCampo;
          }
        },
        onSaved: widget.onCallback,
      ),
    );
  }
}
