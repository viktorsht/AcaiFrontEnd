class Cliente{
  final int id;
  final String nome;
  final String telefone;

  Cliente({required this.id, required this.nome, required this.telefone});

  factory Cliente.fromJson(Map json){
    return Cliente(
      id: json['id'], 
      nome: json['nome'], 
      telefone: json['telefone'],
    );
  }

  Map toJson(){
    return {
      'id': id,
      'nome' : nome,
      'telefone' : telefone,
    };
  }
}