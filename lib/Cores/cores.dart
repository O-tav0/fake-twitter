import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cores {
  Cores._();
  static const _amarelo = 0xFFFBF304;

  static const MaterialColor amareloPrincipal = const MaterialColor(
    _amarelo,
    const <int, Color>{
      500:  const Color(_amarelo),
    },
  );

  //static const Vermelho =  MaterialColor(primary, swatch) Color(0xFFFBF304);
}