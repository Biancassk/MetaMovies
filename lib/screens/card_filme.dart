import 'package:flutter/material.dart';
import 'package:lista_filmes/models/filme.dart';
import 'package:lista_filmes/screens/details_screen.dart';

class CardFilme extends StatelessWidget {
  final String nome;
  final String imagem;
  final String genre;
  final String ano;
  final String duration;
  final String atores;
  final String sinopse;
  final String director;

  const CardFilme(
    this.nome,
    this.imagem,
    this.genre,
    this.ano,
    this.atores,
    this.director,
    this.duration,
    this.sinopse, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                      movie: Filme(
                          nome: nome,
                          imagem: imagem,
                          genre: genre,
                          ano: ano,
                          atores: atores,
                          director: director,
                          duration: duration,
                          sinopse: sinopse)),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imagem),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          nome,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
