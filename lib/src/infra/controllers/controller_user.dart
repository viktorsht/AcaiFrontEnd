import 'dart:convert';
import 'package:app/src/infra/api.dart';
import 'package:http/http.dart' as http;
import 'package:app/src/infra/models/models_login.dart';

class LoginAppController{

  Future<LoginAppModel> postLoginApp(String telefone, String senha) async {
    String apiUrl = "${DataApi.urlBaseApiAuth}token";
    final url = Uri.parse(apiUrl);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'telefone': telefone, 'senha': senha});
    LoginAppModel login;
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      //print(response.body);
      final json = jsonDecode(response.body);
      login = LoginAppModel.fromJson(json);
    } else {
      throw Exception('Erro de autenticação: ${response.statusCode}');
    }
    return login;
  }
  
}