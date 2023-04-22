import 'package:app/src/infra/controllers/controller_categoria.dart';
import 'package:app/src/infra/controllers/controller_recipiente.dart';
import 'package:app/src/infra/models/model_categoria.dart';
import 'package:app/src/infra/models/models_recipientes.dart';
import 'package:app/src/infra/repositorys/repositorio_recipiente.dart';
import 'package:app/src/infra/views/home/components/menu_recipientes.dart';
import 'package:app/src/utils/color/app_colors.dart';
import 'package:flutter/material.dart';

import 'components/recipentes_images.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  int selecionadoRecipiente = -1;

  List<Recipiente> recipientes = [];
  List<CategoriaModel> categorias = [];
  RepositorioRecipiente recipiente = RepositorioRecipiente();
  CategoriaController categoriasController = CategoriaController();

  @override
  void initState() {
    super.initState();
    loadRecipiente();
    //recipentesSelecionado = -1;
  }

  Future<void> loadRecipiente() async {
    // faça a chamada assíncrona aqui
    List<Recipiente> listRecipiente = [];
    RecipienteAppController recipiente = RecipienteAppController();
    listRecipiente = await recipiente.getRecipienteApp();
    setState(() {
      recipientes = listRecipiente;
    });
    final retiraRecipienteRepetido = nomeRecipientes(recipientes);
    categorias = categoriasController.getCategoriaTipo(retiraRecipienteRepetido);
  }

  List<Recipiente> nomeRecipientes(List<Recipiente> recipienteList){
    List<Recipiente> newListRecipientesCategorias = [];
    Set<String> auxiliar = <String>{};
    recipienteList.sort((a, b) => a.nome.compareTo(b.nome));
    for (Recipiente element in recipienteList) {
      if (!auxiliar.contains(element.nome)) {
        newListRecipientesCategorias.add(element);
        auxiliar.add(element.nome);
      }
    }
    return newListRecipientesCategorias;
  }

  @override
  Widget build(BuildContext context) {


    double screenHeight = MediaQuery.of(context).size.height;
    double screenWight = MediaQuery.of(context).size.width;
    //bool _recipienteSelecionado = false;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Escolha o recipiente',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 130.0,
              child:  ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: categorias.length,
                itemBuilder: (BuildContext context, int index){ 
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selecionadoRecipiente = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                            color: selecionadoRecipiente == index ? AppColors.secundaryColorApp : AppColors.grayColorApp,
                              borderRadius: BorderRadius.circular(10)
                              ),
                            child: ImageRecipientes(
                              categoria: categorias[index]
                              ),
                            ),
                        ),
                        Text(
                          categorias[index].nome, 
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),              
            ),
            //const SizedBox(height: 16,),
            SizedBox(
              height: 130.0,
              child:  ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: recipientes.length,
                itemBuilder: (BuildContext context, int index){ 
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          categorias[index].nome, 
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),              
            ),
            Text(
              //'Selecionado: ${recipientes[recipentesSelecionado].nome}'
            selecionadoRecipiente == -1 ? 'No item selected' : 'Selected $selecionadoRecipiente: ${categorias[selecionadoRecipiente].nome}',),
          ],
        ),
      ),
    );
  }
}

/*


*/