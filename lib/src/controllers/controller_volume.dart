import 'package:app/src/models/model_volume.dart';
import 'package:app/src/repositorys/repository_volume.dart';
import 'package:flutter/material.dart';

class HomeController{
  List<VolumeModel> volumes = [];
  final _repository = VolumeRepository();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      volumes = await _repository.getVolumeApi();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}