import 'package:app/src/frame/app_colors.dart';
import 'package:app/src/views/home/components/controller_navigation.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final controllerNavigationBar = NavigationController();
    
    return BottomNavigationBar(
      backgroundColor: AppColors.grayColorApp,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppColors.secundaryColorApp,),
          label: "Home",
          backgroundColor: AppColors.blackColorApp,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        ),
      ],
      selectedItemColor: AppColors.secundaryColorApp,
      selectedLabelStyle: const TextStyle(color: AppColors.secundaryColorApp),
      currentIndex: controllerNavigationBar.currentIndex.value,
      onTap: controllerNavigationBar.onItemTapped,
    );
  }
}