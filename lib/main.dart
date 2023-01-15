import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter/Cores/cores.dart';
import 'package:twitter/components/formulario_criar_conta.dart';
import 'package:twitter/components/tela_inicial.dart';
import 'package:twitter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeData tema = ThemeData();

    @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
 
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>  MyHomePage(),
        '/criarConta': (context) => FormularioCriarConta(),
      },
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Cores.amareloPrincipal,
        ),
        appBarTheme: const AppBarTheme(
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