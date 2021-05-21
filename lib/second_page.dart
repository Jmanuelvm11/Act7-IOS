import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();
  SecondPage({Key key, this.texto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Pagina de Valenzuela"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: "Ingresa alguna palabra",
                  hintText: "Palabra...",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Regresar"),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ), //Fin Material Button
          ], //Fin Widget []
        ), //Fin Column
      ), //Fin Body
    ); //Fin Scaffold
  } //Fin Widget
} //Fin Clase Second Page
