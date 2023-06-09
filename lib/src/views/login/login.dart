import 'package:app/src/frame/app_buttons.dart';
import 'package:app/src/frame/app_colors.dart';
import 'package:flutter/material.dart';

import '../../controllers/controller_user.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  
  final _fromKey = GlobalKey<FormState>();
  final _telefoneController = TextEditingController();
  final _senhaController = TextEditingController();

  LoginAppController loginAppController = LoginAppController();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var image =  SizedBox(
                width: width * 0.5,
                height: height * 0.3,
                child: Image.asset('assets/home.png'),
              );

    /*Future<String> entrar(String phone, String senha) async {
      Telefone telefone = Telefone();
      phone = telefone.formatarTelefone(phone);
      var login = await loginAppController.postLoginApp(phone, senha);
      return login.token;
    }*/

    return Scaffold(
      backgroundColor: AppColors.secundaryColorApp,
      body: Form(
        key: _fromKey,
        child: ListView(
          padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2, top: width * .1),
          children: <Widget>[
            image,
            SizedBox(height: height * 0.02),
            const Center(
              child: Text(
                'Login', 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 25, 
                  color: AppColors.primaryColorApp, 
                )
              ),
            ),
            SizedBox(height: height * 0.02),
            TextFormField(
              controller: _telefoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                labelText: "telefone",
                labelStyle: const TextStyle(
                  color: AppColors.grayColorApp,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  ),
              ),
              style: const TextStyle(fontSize: 20, color: AppColors.primaryColorApp),
              validator: (login){
                if(login == null || login.isEmpty){
                  return 'login vazio!';
                }else{
                return null;
                }
              }
            ),
            const SizedBox(height: 35,),
            TextFormField(
              controller: _senhaController,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "senha",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                labelStyle: const TextStyle(
                  color: AppColors.grayColorApp,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  ),
              ),
              style: const TextStyle(fontSize: 20, color: AppColors.primaryColorApp),
              validator: (senha){
                if(senha == null || senha.isEmpty){
                  return 'senha vazia!';
                }else{
                return null;
                }
              }
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColorApp),
                ),
                child: const Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                },
              ),
            ),
            SizedBox(height: height * 0.05,),
            ElevatedButton(
              style: ButtonApp.themeButtonAppPrimary,
              child: const Text('Entrar',style: TextStyle(
                fontSize: 20,
                color: AppColors.secundaryColorApp,
                fontWeight: FontWeight.bold
                )
              ),
              onPressed: () async {
                //String token = await entrar(_telefoneController.text, _senhaController.text);
                //Navigator.of(context).pushNamed('home');
                //print(token);
              },
            ),
            const SizedBox(height: 15,),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColorApp),
              ),
              onPressed: () {
              },
              child: const Text('Não tenho conta',),
            ),
          ],
        ),
      )
    );
  }
}