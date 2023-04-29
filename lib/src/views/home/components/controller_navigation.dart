import 'package:flutter/material.dart';

class NavigationController{
  final currentIndex = ValueNotifier<int>(0);

  void onItemTapped(int index) {
    print("Index: $index");
    currentIndex.value = index;
    print("currentIndex.value: ${currentIndex.value}");
}
}