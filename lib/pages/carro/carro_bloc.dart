import 'dart:async';

import 'carro.dart';
import 'carro_api.dart';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  void fetch(String tipo) async {
    List<Carro> carros = await CarroApi.getCarros(tipo);

    _streamController.add(carros);
  }

  void dispose() {
    _streamController.close();
  }

}