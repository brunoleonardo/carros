import 'dart:async';

import 'package:carros/pages/login/usuario.dart';
import 'package:carros/pages/simple_bloc.dart';

import '../api_response.dart';
import 'login_api.dart';

class LoginBloc extends SimpleBloc<bool> {
  Future<ApiReponse<Usuario>> login(String login, String senha) async {
    add(true);

    ApiReponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}
