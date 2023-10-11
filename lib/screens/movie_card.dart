import 'package:flutter/material.dart';
import 'package:lista_filmes/models/filme.dart';
import 'package:lista_filmes/screens/details_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Filme movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            clipBehavior: Clip.hardEdge,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                  child: movie.imagem != null
                      ? Ink(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(movie.imagem),
                                fit: BoxFit.cover),
                          ),
                        )
                      : Ink(
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        )),
            )),
        Text(
          movie.nome,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
