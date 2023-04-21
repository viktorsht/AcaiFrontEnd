class Recipiente{
  final int id;
  final String nome;
  final double preco;
  final String volume;

  Recipiente({required this.id, required this.nome, required this.preco, required this.volume});

  factory Recipiente.fromJson(Map json){
    return Recipiente(
      id: json['id'], 
      nome: json['nome'], 
      preco: json['preco'],
      volume: json['volume'],
    );
  }

  Map toJson(){
    return {
      'id': id,
      'nome' : nome,
      'preco' : preco,
      'volume' : volume,
    };
  }
}