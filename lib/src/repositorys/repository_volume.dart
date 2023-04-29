import 'dart:convert';
import 'package:app/src/api/routers_api.dart';
import 'package:app/src/models/model_volume.dart';
import 'package:http/http.dart' as http;

class VolumeRepository{

  Future<List<VolumeModel>> getVolumeApi() async {
    final url = Uri.parse(RoutersApi.volumes);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => VolumeModel.fromJson(json)).toList();
  }
  
}