import 'package:flutter/material.dart';

class NavigationController{
  final currentIndex = ValueNotifier<int>(0);

  void itemPressionadoNavigation(int index) {
    currentIndex.value = index;
  }
}