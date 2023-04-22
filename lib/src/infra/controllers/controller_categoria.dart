import 'package:app/src/infra/models/model_categoria.dart';
import 'package:app/src/utils/images/app_images.dart';

import '../models/models_recipientes.dart';

class CategoriaController{
  List<CategoriaModel> getCategoriaTipo(List<Recipiente> recipiente){
    return [
      CategoriaModel(nome: recipiente[0].nome, imagem: AppImages.barca),
      CategoriaModel(nome: recipiente[1].nome, imagem: AppImages.copo),
      CategoriaModel(nome: recipiente[2].nome, imagem: AppImages.pote),
    ];
  }
}