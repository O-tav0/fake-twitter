import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/Cores/cores.dart';
import 'package:twitter/components/formulario_criar_conta.dart';
import 'package:twitter/components/formulario_fazer_login.dart';

class TelaInicial extends StatefulWidget {

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  _navegarFormCriarConta() {
    Navigator.pushNamed(context, '/criarConta');
  }

  _abrirModalLogin(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(
        children: [
          FormularioLogin()
          ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 150),
                width: 350,
                height: 300,
                child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 100,       
              ),   
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(  
                width: 170,
                height: 50,
                child: InkWell(
                  onTap: () => _navegarFormCriarConta(),
                  splashColor: Colors.grey.shade50,
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                  ),
                  child: Card(
                    color: Cores.amareloPrincipal,
                    shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                                width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                    elevation: 10,
                    child: Center(
                      child: Text('Criar Conta')
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(  
              width: 170,
              height: 50,
              child: InkWell(
                onTap: () => _abrirModalLogin(context),
                splashColor: Colors.grey.shade50,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                ),
                child: Card(
                  color: Cores.amareloPrincipal,
                  shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                              width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                  elevation: 10,
                  child: Center(
                    child: Text('Fazer Login')
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}