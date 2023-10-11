import 'package:http/http.dart' as http;
import 'package:lista_filmes/models/filme.dart';
import 'dart:convert';

class HomeService {
  static Future<List<Filme>> getFilmes() async {
    final response = await http.get(Uri.parse(
        'https://622af3b4-9011-48c8-9282-3a8ec46c3e26.mock.pstmn.io/movies'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List<Filme>.from(json.map((elemento) {
        return Filme.fromJson(elemento);
      }));
    } else {
      return Future.error("Ops! Um erro ocorreu.");
    }
  }

  static Future<List<Filme>> fetchFilmesFromAPI() async {
    final response = await http.post(Uri.parse(
        'https://622af3b4-9011-48c8-9282-3a8ec46c3e26.mock.pstmn.io/cadastro1'));
    if (response.statusCode == 201) {
      List<Filme> retorno = [];
      final json = jsonDecode(response.body);
      retorno.add(Filme.fromJson(json));
      return retorno;
    } else {
      throw Exception('Falha ao carregar filmes');
    }
  }
}
