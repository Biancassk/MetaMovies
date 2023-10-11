import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:lista_filmes/logic/home_states.dart';

import 'package:lista_filmes/screens/controller/home_controller.dart';
import 'package:lista_filmes/screens/form.dart';
import 'package:lista_filmes/screens/listar_filme.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required BuildContext movieContext}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<HomeController>();
    _controller.obterDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Image.asset(
              'assets/images/movie.png',
            ),
          ),
        ),
        title: const Text(
          'MetaMovies',
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, state, child) {
            if (state is HomeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeSuccess) {
              return ValueListenableBuilder(
                  valueListenable: _controller.movies,
                  builder: (context, value, child) {
                    return ListaFilmes(filmes: _controller.movies.value);
                  });
            } else if (state is HomeError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormSreen(
                movieContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
