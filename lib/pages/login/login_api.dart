import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiReponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map params = {'username': login.trim(), 'password': senha.trim()};

      String paramsEncoded = json.encode(params);

      var response =
          await http.post(url, headers: headers, body: paramsEncoded);

      print('>>> Response status: ${response.statusCode}');
      print('>>> Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.saveInSharedPreferences();

        return ApiReponse.ok(user);
      }

      return ApiReponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiReponse.error("Não foi possível fazer o login.");
    }
  }
}
