import 'dart:convert';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class CarroApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.getFromSharedPreferences();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${user.token}"
    };
    
    // print(">>> Headers: ${headers}");

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

    var response = await http.get(url, headers: headers);

    print(">>> URL: ${url}");

    // print(">>> Status Code: ${response.statusCode}");
    // print(">>> Json: ${response.body}");

    try {
      List list = json.decode(response.body);

      List<Carro> carros =
          list.map<Carro>((map) => Carro.fromJson(map)).toList();

      return carros;
    } catch (error, exception) {
      // print("$error > $exception");
      throw exception;
    }
  }
}

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}
