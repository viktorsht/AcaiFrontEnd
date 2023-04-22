import 'package:app/src/infra/models/model_categoria.dart';
import 'package:flutter/material.dart';

class ImageRecipientes extends StatelessWidget {
  final CategoriaModel categoria;
  const ImageRecipientes({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(categoria.imagem, height: 80),
      ],
    );
  }
}