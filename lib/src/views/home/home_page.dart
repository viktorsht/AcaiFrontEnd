import 'package:app/src/controllers/controller_volume.dart';
import 'package:app/src/frame/app_buttons.dart';
import 'package:app/src/frame/app_colors.dart';
import 'package:app/src/views/home/components/controller_navigation.dart';
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
    return ListView.builder(
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

  final List<Widget> listaDePaginasNavigationBar = [
          /*
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          HomeHeader(),
          SizedBox(
            height: 80.0,
            child: AnimatedBuilder(
              animation: controller.state,
              builder: (context, child) => stateManager(controller.state.value),
            ),
          ),
        ],
      ),
    ),
          */
    Container(color: AppColors.secundaryColorApp,),
    Container(color: AppColors.blackColorApp,),
    //Profile(),
  ];

  @override
  Widget build(BuildContext context) {


    //double screenHeight = MediaQuery.of(context).size.height;
    //double screenWight = MediaQuery.of(context).size.width;

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
      body: ValueListenableBuilder(
          valueListenable: controllerNavigationBar.currentIndex, 
          builder: (context, index, builder){
            return Text('data: $index');
          }
        ),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
