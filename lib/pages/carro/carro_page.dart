import 'package:flutter/material.dart';

import 'carro.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(child: Image.network(carro.urlFoto));
  }


}