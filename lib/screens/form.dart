import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:lista_filmes/models/cadastro.dart';

import 'package:lista_filmes/screens/controller/home_controller.dart';

class FormSreen extends StatefulWidget {
  const FormSreen({Key? key, required this.movieContext}) : super(key: key);

  final BuildContext movieContext;

  @override
  State<FormSreen> createState() => _FormSreenState();
}

class _FormSreenState extends State<FormSreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController diretorController = TextEditingController();
  TextEditingController elencoController = TextEditingController();
  TextEditingController plotController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late HomeController _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<HomeController>();

    super.initState();
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de filmes'),
        ),
        body: Container(
          color: Colors.black12,
          child: Center(
            child: Container(
              height: 650,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1)),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    onChanged: (value) {
                      nameController.text = value;
                    },
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Título',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    controller: imageController,
                    decoration: InputDecoration(
                      hintText: 'Pôster',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || int.parse(value) < 1800) {
                        return 'Insira uma data válida';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: anoController,
                    decoration: InputDecoration(
                      hintText: 'Ano de Lançamento',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    controller: generoController,
                    decoration: InputDecoration(
                      hintText: 'Genêro',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    controller: diretorController,
                    decoration: InputDecoration(
                      hintText: 'Diretor',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    controller: elencoController,
                    decoration: InputDecoration(
                      hintText: 'Elenco',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    controller: plotController,
                    decoration: InputDecoration(
                      hintText: 'Sinopse',
                      fillColor: Color.fromARGB(31, 192, 192, 192),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        cadastro filme = cadastro(
                            titulo: nameController.text,
                            poster: imageController.text,
                            ano: anoController.text,
                            atores: elencoController.text,
                            diretor: diretorController.text,
                            genero: generoController.text,
                            sinopse: plotController.text);

                        await _controller.updateFilme();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro concluído com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        print('erro');
                      }
                    },
                    child: Text('Cadastrar'),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
