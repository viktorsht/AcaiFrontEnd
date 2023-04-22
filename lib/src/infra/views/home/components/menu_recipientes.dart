import 'package:flutter/material.dart';
import 'package:app/src/infra/models/model_categoria.dart';
import 'package:app/src/infra/views/home/components/recipentes_images.dart';

class CategoriasListView extends StatelessWidget {
  final List<CategoriaModel> categorias;
  int selecionadoRecipiente;

  CategoriasListView({super.key, 
    required this.categorias,
    required this.selecionadoRecipiente,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => selecionadoRecipiente = index,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selecionadoRecipiente == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ImageRecipientes(categoria: categorias[index]),
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
        },
      ),
    );
  }
}
