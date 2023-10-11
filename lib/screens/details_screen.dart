import 'package:flutter/material.dart';
import 'package:lista_filmes/models/filme.dart';
import 'package:lista_filmes/screens/poster_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});
  final Filme movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Poster(imageURL: movie.imagem),
                PosterCard(
                  nome: movie.nome,
                  genre: movie.genre,
                  duration: movie.duration,
                  ano: movie.ano,
                  atores: movie.atores,
                  director: movie.director,
                  sinopse: movie.sinopse,
                  imagem: movie.imagem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({super.key, required this.imageURL});
  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return imageURL != null
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL!),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2.6,
          )
        : Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            height: MediaQuery.of(context).size.height / 2.6,
            child: const Center(child: Icon(Icons.error)),
          );
  }
}
