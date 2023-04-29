class ProdutoModel {
  int? id;
  String? nome;
  String? descricao;
  int? volumeId;
  String? preco;

  ProdutoModel({this.id, this.nome, this.descricao, this.volumeId, this.preco});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    volumeId = json['volume_id'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['volume_id'] = volumeId;
    data['preco'] = preco;
    return data;
  }
}
