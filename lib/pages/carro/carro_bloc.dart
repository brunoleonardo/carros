import 'package:carros/pages/simple_bloc.dart';

import 'carro.dart';
import 'carro_api.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {

  void fetch(String tipo) async {
    try {
      List<Carro> carros = await CarroApi.getCarros(tipo);

      add(carros);
    } catch (e) {
      addError(e);
    }
  }

}