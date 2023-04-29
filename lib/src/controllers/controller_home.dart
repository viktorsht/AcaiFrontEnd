import 'package:app/src/models/model_produto.dart';
import 'package:app/src/models/model_volume.dart';
import 'package:app/src/repositorys/repository_produto.dart';
import 'package:app/src/repositorys/repository_volume.dart';
import 'package:flutter/material.dart';

class HomeController{
  List<VolumeModel> volumes = [];
  List<ProdutoModel> produdos = [];
  final _repositoryVolume = VolumeRepository();
  final _repositoryProduto = ProdutoRepository();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      volumes = await _repositoryVolume.getVolumeApi();
      produdos = await _repositoryProduto.getProdutosApi();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}