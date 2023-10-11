import 'package:flutter/material.dart';
import 'package:lista_filmes/logic/home_states.dart';

import 'package:lista_filmes/models/filme.dart';
import 'package:lista_filmes/repositories/repository.dart';

class HomeController extends ValueNotifier<HomeStates> {
  HomeController() : super(HomeInitial());

  ValueNotifier<List<Filme>> movies = ValueNotifier<List<Filme>>([]);

  Future<void> obterDados() async {
    value = HomeLoading();
    try {
      movies.value = await HomeService.getFilmes();
      movies.notifyListeners();
      value = HomeSuccess(movies.value);
    } catch (e) {
      value = HomeError(e.toString());
    }
  }

  Future<void> updateFilme() async {
    try {
      movies.value.addAll(await HomeService.fetchFilmesFromAPI());
      movies.notifyListeners();
      value = HomeSuccess(movies.value);
    } catch (e) {
      value = HomeError(e.toString());
    }
  }
}
