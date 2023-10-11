import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  const PosterCard(
      {super.key,
      required this.nome,
      required this.imagem,
      required this.genre,
      required this.ano,
      required this.duration,
      required this.atores,
      required this.sinopse,
      required this.director});

  final String? nome;
  final String? imagem;
  final String? genre;
  final String? ano;
  final String? duration;
  final String? atores;
  final String? sinopse;
  final String? director;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        elevation: 5,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 500,
            maxHeight: 500,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(nome ?? 'Nome Indisponível',
                              style: TextStyle(fontSize: 50)),
                          Text(
                            'Ano:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(genre ?? 'Gênero Indisponível',
                              style: TextStyle(fontSize: 30)),
                          Text(
                            'Genêro:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(duration ?? 'Duração Indisponível',
                              style: TextStyle(fontSize: 20)),
                          Text(
                            'Diretor:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(atores ?? 'Atores Indisponível',
                              style: TextStyle(fontSize: 20)),
                          Text(
                            'Atores:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(ano ?? 'Ano Indisponível',
                              style: TextStyle(fontSize: 20)),
                          Text(
                            'Duração:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(director ?? 'Diretor Indisponível',
                              style: TextStyle(fontSize: 20)),
                          Text(
                            'Sinopse:',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(221, 141, 139, 139),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(sinopse ?? 'Sinopse Indisponível',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
