import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  List<String> textos = [
    '¿A que se debe que las amistades verdaderas predominan mas en la universidad que en la preparatoria?',
    '¿Puedes sentir soledad aun estando acompañado?',
    '¿En que país te hubiera gustado nacer?',
    '¿Debemos culpar a los demás por la vida que nos toco vivir?',
    '¿Hoy en dia, todavía existe el termino “hasta que la muerte nos separe?',
    '¿Que opinas de la perdida de una futuro deseado?',
    '¿Que sígnica para ti el perdón?',
    '¿El cambio es algo único y totalmente impermanente?',
    '¿Por que los seremos humanos necesitamos esa capacidad de control?',
    '¿Por que lo que es familiar es comodo?',
    '¿Es posible conocerse asimismo?',
    '¿Por que generamos resistencia al cambio?',
    '¿Que opinas de la paradoja del “hubiera”?',
    '¿Para que es la memoria humana?',
    '¿Que son las metanarrativas?',
    '¿Por que la gran realización, es que el tiempo no es lineal?',
    '¿Por que una persona, debería poner sus habilidades, herramientas, en beneficio de la sociedad?',
    '¿Cual y como fue la ultima vez que ayudaste a alguien?',
    '¿Si pudieras vivir un dia, una y otra vez a voluntad propia, que harías?',
    '¿Cuáles son esas actividades por las cuales vale la pena vivir?',
    '¿Que es lo que no te gusta de las nuevas generaciones?',
    '¿Hoy en día existe mucha desinformación, por la saturación de la misma, estarías dispuesto a poner un bloqueo de censura?',
    '¿Es bueno ser el mas listo del cuarto?',
    '¿Qué harías si el dinero no fuera problema?',
    '¿Donde predomina mas la felicidad, la gente con mas poder adquisitivo o la que no?',
    '¿Que es lo peor que te han hecho?',
    '¿Por que es fácil dar consejos pero no el poder seguirlos?',
    '¿Por que es tan importante la familia?',
    '¿Por que nos victimizamos?',
    '¿Durante tu vida, haz vivido mas felicidad o tristeza?',
    '¿Por que aveces experimentamos situaciones en las que sentimos que no podemos salir de ahí?',
    '¿En el mundo predomina mas la felicidad o la tristeza?',
    '¿Estas satisfecho con tu vida?',
    '¿Una persona feliz, es una persona satisfecha con su vida?',
    '¿Es necesario la dialéctica?',
    '¿Que prefieres, la monogamia o la poligamia?',
    '¿Le tienes miedo a la soledad?',
    '¿Que es lo que tengo mal de mi?',
    '¿Podemos enamorarnos sin idealizar al otro?',
    '¿Por que el amor escapa la razón?',
    '¿Si me niego a idealizar, me niego a enamorarme?',
    '¿Eran más felices nuestros abuelos, o nosotros?',
    '¿Mentir bajo cualquier circunstancia es malo?',
    '¿Si pudieras cambiar el destino de alguien y afectar el de otro para mal, lo harías?',
    '¿A que le temes?',
    '¿Para ti que significa tu tiempo?',
    '¿Qué haces con tu tiempo?',
    'El miedo nos ayuda a prevenir peligros, pero, ¿Por que nos dan miedo situaciones que no representan peligro?',
    '¿Le temes a la muerte?',
    '¿En qué circunstancias matarías?',
    '¿Nos da miedo morir? o ¿Nos da miedo el como vamos a sufrir al morir?',
    '¿Te da miedo el no tener control de ti mismo?',
    '¿Realmente somos libres?',
    '¿Un cambio de forma individual puede cambiar una sociedad?',
    'Uno nunca va estar listo para ser papá, pero, ¿Cuáles crees que serian las cualidades necesarias para serlo?',
    '¿Condicionarías retirar el derecho a tener hijos?',
    '¿Te gusta lo impredecible?',
    '¿Le tienes miedo al futuro?',
    '¿Que podría pasar para quitarnos la cualidad que tenemos para amar?',
    '¿Que opinas del consumismo?',
    '¿Nuestra nueva sociedad promueve la individualización extrema?',
    '¿Crees en el, “hasta que la muerte nos separe?',
    '¿El humano llegara aun punto de conformismo, en el que ya no quiera trascender?',
    '¿Como es el amor maduro?',
    '¿Crees que por miedo al arriesgar el amor, terminamos arriesgando el amor?',
    ' ¿Es necesario tener un propósito en la vida?',

    // Aqui se pondran nuevas ideas
  ];
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
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
