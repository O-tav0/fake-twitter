import 'package:flutter/material.dart';
import 'package:twitter/Cores/cores.dart';
import 'package:twitter/components/tela_inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeData tema = ThemeData();

    @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
 
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Cores.amareloPrincipal,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Cores.amareloPrincipal
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  double widget1Opacity = 0.0;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _visible = true;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
      opacity:_visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1400),
      child: TelaInicial()
    )
    );
  }
}