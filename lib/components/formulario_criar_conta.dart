import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:twitter/Cores/cores.dart';

class FormularioCriarConta extends StatefulWidget {

  @override
  State<FormularioCriarConta> createState() => _FormularioCriarContaState();
}

class _FormularioCriarContaState extends State<FormularioCriarConta> {

  final nomeController = TextEditingController();
  final nomeUsuarioController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final paisController = TextEditingController();
  String dataNascimento = "";
  

  XFile ?_image;
  final picker = ImagePicker();

  Future recuperarImagem() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  _selecionarDataNascimento(DateRangePickerSelectionChangedArgs args) {
    dataNascimento = args.value; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Column(           
            children: [
              InkWell(
                onTap: () => recuperarImagem(),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 100,
                      backgroundImage: _image != null ? Image.file(
                        File(_image!.path),
                        fit: BoxFit.fill,
                      ).image : const AssetImage('assets/avatar.png'),
                  )   
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(         
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                )
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nomeUsuarioController,
                decoration: const InputDecoration(
                  labelText: 'Nome de Usuário',
                )
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(         
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                )
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Data de Nascimento'),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    child: SfDateRangePicker(
                      onSelectionChanged: _selecionarDataNascimento,
                      todayHighlightColor: Colors.white,
                      yearCellStyle: const DateRangePickerYearCellStyle(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                        todayTextStyle:  TextStyle(
                          color: Colors.black,
                        )
                      ),
                      selectionTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      selectionMode: DateRangePickerSelectionMode.single,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: paisController,
                decoration: const InputDecoration(
                  labelText: 'País',
                )
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(  
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: InkWell(
                  onTap: () => {},
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
              )
            ]
          ),
        ),
      ),
    );
  }
}