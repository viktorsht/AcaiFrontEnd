import 'package:app/src/controllers/controller_home.dart';
import 'package:app/src/frame/app_buttons.dart';
import 'package:app/src/frame/app_colors.dart';
import 'package:app/src/models/model_produto.dart';
import 'package:app/src/models/model_volume.dart';
import 'package:app/src/views/home/components/controllers/controller_navigation.dart';
import 'package:app/src/views/home/components/home_header.dart';
import 'package:app/src/views/loading/loading.dart';
import 'package:app/src/views/home/components/navigation_bar.dart';
import 'package:app/src/views/profile.dart';
import 'package:flutter/material.dart';

import '../erro/erro_page.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  int volumeSelecionado = -1;
  int tamanhoListaVolumes = 0;
  int itemSelecionado = -1;
  List<ProdutoModel> produtosExibidos = [];

  final controller = HomeController();
  final controllerNavigationBar = NavigationController();
  //final controllerProduto = ProdutoSelecionadoController();
  
  _error(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ErroPage(),
          TextButton(
            style: ButtonApp.themeButtonAppSecundary,
            onPressed: (){
              controller.start();
            },
            child: const Text("Tentar Novamente", style: TextStyle(color: AppColors.primaryColorApp),),
          ),
        ],
      ),
    );
  }

  _loading(){
    return const LoagindPage();
  }

  _start(){
    return Container();
  }

  _sucess(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            "Produtos disponíveis",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.produtos.length,
            itemBuilder: (BuildContext context, int index) {
              if(tamanhoListaVolumes == controller.volumes.length) tamanhoListaVolumes = 0;
              if(tamanhoListaVolumes != 0) tamanhoListaVolumes++;

              final produto = controller.produtos[index];

              // Se não há um volume selecionado, exibir todos os itens
              if (volumeSelecionado == -1) {
                VolumeModel volumeModel = controller.volumes.firstWhere(
                  (volume) => volume.id == controller.produtos[index].volumeId, 
                  orElse: () => VolumeModel(nome: "", id: -1)
                );
                return ListTile(
                  title: Text(
                    '${controller.produtos[index].nome} de ${volumeModel.nome}   R\$ ${controller.produtos[index].preco}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  subtitle: Text(
                      '${controller.produtos[index].descricao}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                );
              }
              // Se há um volume selecionado, exibir apenas os itens com esse volume
              if (controller.produtos[index].volumeId == volumeSelecionado + 1) {
                VolumeModel volumeModel = controller.volumes.firstWhere(
                  (volume) => volume.id == controller.produtos[index].volumeId, 
                  orElse: () => VolumeModel(nome: "", id: -1)
                );
                /*
                VolumeModel volumeModel = controller.volumes.firstWhere(
                  (volume) => volume.id == controller.produtos[index].volumeId,  SE OS PRODUTO FORAM COM O VOLUME ERRADO, OLHE AQUI
                  orElse: () => VolumeModel(nome: "", id: -1)
                );*/
                return RadioListTile<int>(
                  activeColor: AppColors.secundaryColorApp,
                    title: Text(
                      //'${produto.nome} - ${volumeModel.nome} - ${produto.preco}', SE OS PRODUTO FORAM COM O VOLUME ERRADO, OLHE AQUI
                      '${produto.nome} de ${volumeModel.nome}   R\$ ${produto.preco}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    subtitle: Text(
                      '${produto.descricao}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    value: produto.id!,
                    groupValue: itemSelecionado,
                    onChanged: (int? value) {
                      if (value == controller.produtos[index].id) {
                        setState(() {
                          itemSelecionado = value!;
                        });
                      }
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

  buttonCartColor(int value){
    if (value != -1) {
      return ElevatedButton(
        style: ButtonApp.themeButtonAppCart, 
        onPressed: (){}, 
        child: Row(
          mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.shopping_cart),
              SizedBox(width: 8),
              Text('Adicionar ao carrinho'),
            ],
          ),
        );
    } else {
      return Container();
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
                          height: itemSelecionado != -1 ? 450 : 500,
                          child: AnimatedBuilder(
                            animation: controller.state,
                            builder: (context, child) => stateManager(controller.state.value),
                          ),
                        ),
                        buttonCartColor(itemSelecionado)
                      ],
                    ),
                  ),
                  const Profile(),
                ],
              );
            }
          ),
      ),
      bottomNavigationBar: HomeNavigationBar(controllerNavigationBar: controllerNavigationBar,),
    );
  }
}
