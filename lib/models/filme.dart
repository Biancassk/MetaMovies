class Filme {
  String nome;
  String imagem;
  String genre;
  String ano;
  String duration;
  String atores;
  String sinopse;
  String director;

  Filme({
    required this.nome,
    required this.imagem,
    required this.genre,
    required this.ano,
    required this.atores,
    required this.director,
    required this.duration,
    required this.sinopse,
  });

  Filme.fromJson(Map<String, dynamic> json)
      : nome = json['nome'].toString(),
        imagem = json['imagem'].toString(),
        genre = json['genero'].toString(),
        ano = json['ano'].toString(),
        duration = json['duracao'].toString(),
        atores = json['atores'].toString(),
        sinopse = json['sinopse'].toString(),
        director = json['diretor'].toString();
}
