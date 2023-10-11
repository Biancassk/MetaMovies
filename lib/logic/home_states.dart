import 'package:lista_filmes/models/filme.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final List<Filme> movies;
  HomeSuccess(this.movies);
}

class HomeError extends HomeStates {
  HomeError(this.error);
  final String error;
}
