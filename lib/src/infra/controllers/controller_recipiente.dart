import 'dart:convert';
import 'package:app/src/infra/api.dart';
import 'package:app/src/infra/models/models_recipientes.dart';
import 'package:http/http.dart' as http;

class RecipienteAppController{

  Future<List<Recipiente>> getRecipienteApp() async {
    String apiUrl = "${DataApi.urlBaseApi}recipientes";
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);

    List<Recipiente> recipientes = [];
    
    if (response.statusCode == 200) {

      final list = jsonDecode(response.body) as List;
      for (var json in list) {
        final recipiente = Recipiente.fromJson(json);
        recipientes.add(recipiente);
      }
    }
    else {
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
    return recipientes;
  }
  
}