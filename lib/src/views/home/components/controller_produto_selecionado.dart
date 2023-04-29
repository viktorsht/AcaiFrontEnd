import 'package:flutter/material.dart';

class ProdutoSelecionadoController{
  final currentIndex = ValueNotifier<int>(0);

  void produtoSelecioando(int index) {
    currentIndex.value = index;
  }
}