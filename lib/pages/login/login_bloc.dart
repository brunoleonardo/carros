import 'dart:async';

import 'package:carros/pages/login/usuario.dart';

import '../api_response.dart';
import 'login_api.dart';

class LoginBloc {

  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiReponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);

    ApiReponse response = await LoginApi.login(login, senha);

    _streamController.add(false);

    return response;
  }

  void dispose() {
    _streamController.close();
  }

}