class CategoriaModel{
  final String nome;
  final String imagem;

  CategoriaModel({required this.nome, required this.imagem});

  factory CategoriaModel.fromJson(Map json){
    return CategoriaModel(
      nome: json['nome'], 
      imagem: json['preco'],
    );
  }

  Map toJson(){
    return {
      'nome' : nome,
      'imagem' : imagem,
    };
  }
}