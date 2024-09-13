import 'dart:convert';

import 'package:http/http.dart' as http;

class FraseRacionaisModel {
  String? frase;
  String? autor;

  FraseRacionaisModel({this.frase, this.autor});

  FraseRacionaisModel.fromJson(Map<String, dynamic> json) {
    frase = json['frase'];
    autor = json['autor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frase'] = this.frase;
    data['autor'] = this.autor;
    return data;
  }

  static Future<FraseRacionaisModel> puxarFrase() async {
  final response = await http
      .get(Uri.parse('https://estevaorada.com/aulas/api/frases/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FraseRacionaisModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an e
    throw Exception('Falha ao obter frase');
  }
}
}