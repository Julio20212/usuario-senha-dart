import 'package:flutter/material.dart';
import 'package:projeto_imc/Atividade1.dart';

import 'Atividade1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Atividade1(),
    );
  }
}
