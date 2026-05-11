import '../modelo/modelo_conteo_cantidades.dart';

class ControladorConteoCantidades {
  String? validarN(String valor) {
    if (valor.trim().isEmpty) {
      return 'Ingrese la cantidad de valores a procesar';
    }

    final int? cantidad = int.tryParse(valor);
    if (cantidad == null) {
      return 'N debe ser un número entero válido';
    }

    if (cantidad <= 0) {
      return 'N debe ser mayor a 0';
    }

    if (cantidad > 100) {
      return 'N no puede superar 100';
    }

    return null;
  }

  String? validarValor(String valor) {
    if (valor.trim().isEmpty) {
      return 'Todos los campos deben estar llenos';
    }

    final double? numero = double.tryParse(valor);
    if (numero == null) {
      return 'Ingrese un número válido';
    }

    return null;
  }

  ConteoCantidades contar(List<double> valores) {
    var ceros = 0;
    var menoresCero = 0;
    var mayoresCero = 0;

    for (final valor in valores) {
      if (valor == 0) {
        ceros++;
      } else if (valor < 0) {
        menoresCero++;
      } else {
        mayoresCero++;
      }
    }

    return ConteoCantidades(
      ceros: ceros,
      menoresCero: menoresCero,
      mayoresCero: mayoresCero,
    );
  }
}