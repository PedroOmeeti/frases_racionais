import 'package:frases_racionais/model/frase_racionais_model.dart';

class HomeController {
  String resultado = "";
  FraseRacionaisModel frase = FraseRacionaisModel();
  
  Future<FraseRacionaisModel> puxarFrase() async {
    frase = await FraseRacionaisModel.puxarFrase();
    return frase;
  }
}