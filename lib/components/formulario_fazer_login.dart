import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:twitter/Cores/cores.dart';

class FormularioLogin extends StatefulWidget {
  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  _navegarFeed() {
    Navigator.pushNamed(context, '/feed');
  }
  
  _realizarLoginFirebase(context) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: senhaController.value.text
      ).then((value) => _navegarFeed());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        QuickAlert.show(
            confirmBtnText: 'OK',
            context: context,
            type: QuickAlertType.error,
            text: 'Usuário com esse e-mail não foi encontrado!');
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
            confirmBtnText: 'OK',
            context: context,
            type: QuickAlertType.error,
            text: 'Senha incorreta!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30,50,30,50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                )),
            const SizedBox(
              height: 40,
            ),
            TextField( 
                obscureText: true,
                controller: senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                )),
            const SizedBox(
              height: 60,
            ),    
            SizedBox(
              width: 170,
              height: 50,
              child: InkWell(
                      onTap: () => _realizarLoginFirebase(context),
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
            )    
          ]),
        ),
      ),
    );
  }
}
