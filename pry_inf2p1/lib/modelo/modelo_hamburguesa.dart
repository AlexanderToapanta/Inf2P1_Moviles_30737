
enum TipoHamburguesa { sencilla, doble, triple }

class ItemHamburguesa {
  TipoHamburguesa tipo;
  int cantidad;

  ItemHamburguesa({
    required this.tipo,
    required this.cantidad,
  });

  double obtenerPrecioUnitario() {
    switch (tipo) {
      case TipoHamburguesa.sencilla:
        return 20.0;
      case TipoHamburguesa.doble:
        return 25.0;
      case TipoHamburguesa.triple:
        return 28.0;
    }
  }

  double calcularSubtotal() {
    return obtenerPrecioUnitario() * cantidad;
  }
}

class PedidoHamburguesaModel {
  List<ItemHamburguesa> items;
  static const double cargoTarjetaPorcentaje = 5.0;
  bool pagaConTarjeta;

  PedidoHamburguesaModel({
    required this.items,
    this.pagaConTarjeta = false,
  });

  // Calcular subtotal (suma de todas las hamburguesas)
  double calcularSubtotal() {
    double subtotal = 0;
    for (var item in items) {
      subtotal += item.calcularSubtotal();
    }
    return subtotal;
  }

  // Calcular total sin tarjeta
  double calcularTotalSinTarjeta() {
    return calcularSubtotal();
  }

  // Calcular cargo por tarjeta (5% sobre el subtotal)
  double calcularCargoTarjeta() {
    if (pagaConTarjeta) {
      return calcularSubtotal() * (cargoTarjetaPorcentaje / 100);
    }
    return 0;
  }

  // Calcular total a pagar (con o sin cargo de tarjeta)
  double calcularTotalAPagar() {
    return calcularSubtotal() + calcularCargoTarjeta();
  }

  // Obtener resumen completo del pedido
  Map<String, dynamic> obtenerResumenPedido() {
    final subtotal = calcularSubtotal();
    final cargoTarjeta = calcularCargoTarjeta();
    final total = calcularTotalAPagar();

    return {
      'items': items,
      'subtotal': subtotal,
      'pagaConTarjeta': pagaConTarjeta,
      'porcentajeTarjeta': cargoTarjetaPorcentaje,
      'cargoTarjeta': cargoTarjeta,
      'total': total,
    };
  }

  // Obtener total de hamburguesas (suma de cantidades)
  int obtenerTotalHamburguesas() {
    int total = 0;
    for (var item in items) {
      total += item.cantidad;
    }
    return total;
  }

  // Obtener desglose por tipo
  Map<String, dynamic> obtenerDesglosePorTipo() {
    int sencillas = 0;
    int dobles = 0;
    int triples = 0;

    for (var item in items) {
      switch (item.tipo) {
        case TipoHamburguesa.sencilla:
          sencillas += item.cantidad;
          break;
        case TipoHamburguesa.doble:
          dobles += item.cantidad;
          break;
        case TipoHamburguesa.triple:
          triples += item.cantidad;
          break;
      }
    }

    return {
      'sencillas': sencillas,
      'dobles': dobles,
      'triples': triples,
    };
  }
}