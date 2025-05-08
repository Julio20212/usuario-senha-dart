import 'dart:math';

import 'package:flutter/material.dart';

class Atividade1 extends StatefulWidget {
  const Atividade1({super.key});

  @override
  State<Atividade1> createState() => _HomeState();
}

class _HomeState extends State<Atividade1> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String _textInfo = "Informe seus dados";

  void _limpar_Tela() {
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textInfo = "Informe seus dados";
    });
  }

  void _cadastrar() {
    setState(() {
      String usuario = usuarioController.text.trim();
      String senha = senhaController.text.trim();

      if (usuario.isEmpty || senha.isEmpty) {
        _textInfo = "Erro ao cadastrar";
      } else {
        _textInfo = "Usuário cadastrado";
        usuarioController.text = "";
        senhaController.text = "";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
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
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.indigo)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senhaController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text("Cadastrar"),
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
