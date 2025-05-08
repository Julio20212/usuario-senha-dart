import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _textInfo = "Informe seus dados";

  void _limpar_Tela() {
    pesoController.text = " ";
    alturaController.text = " ";
    setState(() {
      _textInfo = "Informe seus dados";
    });
  }

  void _calcular_imc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso / pow((altura /100), 2);
      if (imc < 16.5) {
        _textInfo = "Desnutrido, com seus (${imc}) kg.";
      } else if (imc <= 18.5) {
        _textInfo = "Magro, coms seus (${imc}) kg.";
      } else if (imc <= 24.9) {
        _textInfo = "Peso ideal, com seu (${imc}) kg.";
      } else if (imc <= 29.9) {
        _textInfo = "Sobrepeso, com seus (${imc}) kg.";
      } else if (imc <= 34.9) {
        _textInfo = "Obesidade grau 1, com seus (${imc}) kg.";
      } else if (imc <= 39.9) {
        _textInfo = "Obesidade grau 2, com seus (${imc}) kg.";
      } else {
        _textInfo = "Obesidade grau 3, com seus (${imc}) kg.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person,
              size: 120,
              color: Colors.blueAccent,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: pesoController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _calcular_imc,
                  child: const Text("Calcular"),
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
