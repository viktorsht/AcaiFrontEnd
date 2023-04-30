import 'package:app/src/frame/app_colors.dart';
import 'package:app/src/views/home/components/controllers/controller_navigation.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  final NavigationController controllerNavigationBar;
  
  const HomeNavigationBar({super.key, required this.controllerNavigationBar});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: controllerNavigationBar.currentIndex,
      builder: (BuildContext context, value, Widget? child) { 
        return  BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            ),
          ],
          currentIndex: controllerNavigationBar.currentIndex.value,
          onTap: controllerNavigationBar.itemPressionadoNavigation,
          selectedItemColor: AppColors.secundaryColorApp,
          unselectedItemColor: AppColors.grayTextColorApp,
        ); 
      }
    );
  }
}