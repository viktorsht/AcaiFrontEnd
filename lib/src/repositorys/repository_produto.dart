import 'dart:convert';
import 'package:app/src/api/routers_api.dart';
import 'package:app/src/models/model_produto.dart';
import 'package:http/http.dart' as http;

class ProdutoRepository{

  Future<List<ProdutoModel>> getProdutosApi() async {
    final url = Uri.parse(RoutersApi.produtos);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => ProdutoModel.fromJson(json)).toList();
  }
  
}