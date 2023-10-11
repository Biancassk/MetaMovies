class cadastro {
  String titulo;
  String ano;
  String diretor;
  String atores;
  String genero;
  String sinopse;
  String poster;

  cadastro(
      {required this.titulo,
      required this.poster,
      required this.ano,
      required this.atores,
      required this.diretor,
      required this.genero,
      required this.sinopse});

  cadastro.fromJson(Map<String, dynamic> json)
      : titulo = json['titulo'].toString(),
        poster = json['poster'].toString(),
        ano = json['ano'].toString(),
        atores = json['atores'].toString(),
        diretor = json['diretor'].toString(),
        genero = json['genero'].toString(),
        sinopse = json['sinopse'].toString();

  Map<String, dynamic> toMap() => {
        "titulo": this.titulo,
        "ano": this.ano,
        "atores": this.atores,
        "diretor": this.diretor,
        "genero": this.genero,
        "sinopse": this.sinopse,
        "poster": this.poster,
      };
}
