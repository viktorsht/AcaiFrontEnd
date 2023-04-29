import 'package:app/src/models/models_user.dart';

class LoginAppModel{
  final Cliente cliente;
  final String token;

  LoginAppModel({required this.cliente, required this.token});

  factory LoginAppModel.fromJson(Map json){
    return LoginAppModel(
      cliente: Cliente.fromJson(json['cliente']), 
      token: json['token']
    );
  }
  Map toJson(){
    return {
      'cliente': cliente.toJson(),
      'token' : token,
    };
  }
}