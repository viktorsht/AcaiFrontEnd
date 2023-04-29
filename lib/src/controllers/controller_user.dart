import 'dart:convert';
import 'package:app/src/api/api.dart';
import 'package:app/src/models/models_login.dart';
import 'package:http/http.dart' as http;

class LoginAppController{

  Future<LoginAppModel> postLoginApp(String telefone, String senha) async {
    String apiUrl = "${Api.urlApi}token";
    final url = Uri.parse(apiUrl);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'telefone': telefone, 'senha': senha});
    LoginAppModel login;
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      login = LoginAppModel.fromJson(json);
    } else {
      throw Exception('Erro de autenticação: ${response.statusCode}');
    }
    return login;
  }
  
}