import 'dart:math';
import 'package:flutter/material.dart';

import 'mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDataBase.initialize();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'asset/icons/hablemos.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20.0),
              Text(
                textoActual,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
