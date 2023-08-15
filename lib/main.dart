import 'dart:math';
import 'package:flutter/material.dart';

import 'mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDataBase.connect();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomTextPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomTextPage extends StatefulWidget {
  @override
  _RandomTextPageState createState() => _RandomTextPageState();
}

class _RandomTextPageState extends State<RandomTextPage> {
  List textos = MongoDataBase.fullQuestions;
  //List textos = ["¿Crees que el amigo es otro yo?"];
  String textoActual = '';
  final random = Random();

  @override
  void initState() {
    super.initState();
    textoActual = textos[0]; // INICIALIZA con el primer texto
  }

  void cambiarTexto() {
    setState(() {
      textoActual = (textos..shuffle(random)).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cambiarTexto,
      child: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            textoActual,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
