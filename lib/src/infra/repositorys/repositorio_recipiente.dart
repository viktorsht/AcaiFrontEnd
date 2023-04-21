import 'package:app/src/infra/models/models_recipientes.dart';

import '../controllers/controller_recipiente.dart';

class RepositorioRecipiente{
  Future<List<Recipiente>> loadRecipiente() async {
    List<Recipiente> listRecipiente = [];
    RecipienteAppController recipientes = RecipienteAppController();
    listRecipiente = await recipientes.getRecipienteApp();
    return listRecipiente;
  }
}