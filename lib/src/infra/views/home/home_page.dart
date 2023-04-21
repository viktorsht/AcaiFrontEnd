import 'package:app/src/infra/controllers/controller_recipiente.dart';
import 'package:app/src/infra/models/models_recipientes.dart';
import 'package:app/src/infra/repositorys/repositorio_recipiente.dart';
import 'package:app/src/utils/color/app_colors.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  List<Recipiente> recipientes = [];
  RepositorioRecipiente recipiente = RepositorioRecipiente();
  @override
  void initState() {
    super.initState();
    loadRecipiente();
  }

  Future<void> loadRecipiente() async {
    // faça a chamada assíncrona aqui
    List<Recipiente> listRecipiente = [];
    RecipienteAppController recipiente = RecipienteAppController();
    listRecipiente = await recipiente.getRecipienteApp();
    setState(() {
      recipientes = listRecipiente;
    });
    print(recipientes.toList());
  }

  @override
  Widget build(BuildContext context) {


    double screenHeight = MediaQuery.of(context).size.height;
    double screenWight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColorApp,
      appBar: AppBar(
        backgroundColor: AppColors.secundaryColorApp,
        elevation: 1.0,
        centerTitle: true,
        title: const Text('Açaiteria', 
          style: TextStyle(
            color: AppColors.primaryColorApp,
            fontWeight: FontWeight.w500,
            fontSize: 30,
            ),
          ),
        actions: [
           IconButton(
            icon: const Icon(Icons.person,),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Cardápio',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              child: ListView.builder(
                //scrollDirection: Axis.horizontal, 
                itemCount: recipientes.length,
                itemBuilder: (BuildContext context, int index){ 
                  return ListTile(title: Text(recipientes[0].nome));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}