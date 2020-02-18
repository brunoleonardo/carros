import 'dart:convert' as convert;

import 'package:carros/utils/prefs.dart';

class Usuario {
  int id;

  String login;

  String nome;

  String email;

  String urlFoto;

  String token;

  List<String> roles;

  static const userPrefsKey = "user.prefs";

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void saveInSharedPreferences() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString(userPrefsKey, json);
  }

  static void clearFromSharedPreferences() {
    Prefs.setString(userPrefsKey, "");
  }

  static Future<Usuario> getFromSharedPreferences() async {
    String json = await Prefs.getString(userPrefsKey);
    if (json == null || json.isEmpty) {
      return null;
    }
    
    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromJson(map);

    return user;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }

}
