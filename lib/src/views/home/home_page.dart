import 'package:app/src/controllers/controller_home.dart';
import 'package:app/src/frame/app_buttons.dart';
import 'package:app/src/frame/app_colors.dart';
import 'package:app/src/models/model_produto.dart';
import 'package:app/src/models/model_volume.dart';
import 'package:app/src/views/home/components/controller_navigation.dart';
import 'package:app/src/views/home/components/home_header.dart';
import 'package:app/src/views/home/components/navigation_bar.dart';
import 'package:app/src/views/profile.dart';
import 'package:flutter/material.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  int volumeSelecionado = -1;
  int tamanhoListaVolumes = 0;
  int itemSelecionado = 0;
  List<ProdutoModel> produtosExibidos = [];

  final controller = HomeController();
  final controllerNavigationBar = NavigationController();

  _error(){
    return Center(
      child: ElevatedButton(
        style: ButtonApp.themeButtonAppSecundary,
        onPressed: (){
          controller.start();
        },
        child: const Text("Tentar Novamente"),
      ),
    );
  }

  _loading(){
    return const Center(child: CircularProgressIndicator(),);
  }

  _start(){
    return Container();
  }

  _sucess(){
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, 
            itemCount: controller.volumes.length,
            itemBuilder: (BuildContext context, int index){ 
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          volumeSelecionado = index;
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: volumeSelecionado == index ? AppColors.secundaryColorApp : AppColors.grayColorApp,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          "${controller.volumes[index].nome}", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 20,
                            color: volumeSelecionado == index ? AppColors.primaryColorApp : AppColors.blackColorApp
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.produdos.length,
            itemBuilder: (BuildContext context, int index) {
              /*
              if (volumeSelecionado == -1) {
                // se nenhum volume foi selecionado, exibir todos os produtos
                return ListTile(
                  title: Text('${controller.produdos[index].nome} - ${controller.volumes.firstWhere((volume) => volume.id == controller.produdos[index].volumeId, orElse: () => VolumeModel(nome: "", id: -1)).nome} - ${controller.produdos[index].preco}'),);
              }
              else {
                if(controller.produdos[index].volumeId == volumeSelecionado + 1){
                  return ListTile(title: Text('${controller.produdos[index].nome} - ${controller.volumes.firstWhere((volume) => volume.id == controller.produdos[index].volumeId, orElse: () => VolumeModel(nome: "", id: -1)).nome} - ${controller.produdos[index].preco}'),);
                }
                else {
                  return Container();
                }
              }*/

      if(tamanhoListaVolumes == controller.volumes.length) tamanhoListaVolumes = 0;
      if(tamanhoListaVolumes != 0) tamanhoListaVolumes++;

      final volume = controller.volumes[tamanhoListaVolumes];
      print("volume: ${controller.produdos[tamanhoListaVolumes].volumeId}");

      // Se não há um volume selecionado, exibir todos os itens
      if (volumeSelecionado == -1) {
        return RadioListTile<int>(
          title: Text(
            '${controller.produdos[index].nome} - ${volume.nome} - ${controller.produdos[index].preco}',
          ),
          value: controller.produdos[tamanhoListaVolumes].volumeId!,
          groupValue: itemSelecionado,
          onChanged: (int? value) {
            setState(() {
              itemSelecionado = value!;
              print(itemSelecionado);
            });
          },
        );
      }

      // Se há um volume selecionado, exibir apenas os itens com esse volume
      if (controller.produdos[index].volumeId == volumeSelecionado + 1) {
        return RadioListTile<int>(
          title: Text(
            '${controller.produdos[index].nome} - ${volume.nome} - ${controller.produdos[index].preco}',
          ),
          value: volume.id!,
          groupValue: itemSelecionado,
          onChanged: (int? value) {
            setState(() {
              itemSelecionado = value!;
              print(itemSelecionado);
            });
          },
        );
      }

      // Se não for para exibir o item, retornar um Container vazio
      return Container();


            },
          ),
        )
      ],
    );
  }

  stateManager(HomeState state){
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.sucess:
        return _sucess();
      case HomeState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.shopping_cart,),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: controllerNavigationBar.currentIndex, 
            builder: (context, index, builder){
              return IndexedStack(
                index: index,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HomeHeader(),
                        SizedBox(
                          height: 450,
                          child: AnimatedBuilder(
                            animation: controller.state,
                            builder: (context, child) => stateManager(controller.state.value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ProductList(),
                ],
              );
            }
          ),
      ),
      bottomNavigationBar: HomeNavigationBar(controllerNavigationBar: controllerNavigationBar,),
    );
  }
}
