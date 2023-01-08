import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FormularioCriarConta extends StatefulWidget {

  @override
  State<FormularioCriarConta> createState() => _FormularioCriarContaState();
}

class _FormularioCriarContaState extends State<FormularioCriarConta> {

  final nomeController = TextEditingController();
  final nomeUsuarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    )
                  ),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome de Usuário',
                    )
                  ),
                  TextField(
                    obscureText: true,
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    )
                  ),
                  TextField(
                    obscureText: true,
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    )
                  ),
                  SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                ]
              ),
            ),
          );
  }
}