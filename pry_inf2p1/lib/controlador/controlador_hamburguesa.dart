
import '../modelo/modelo_hamburguesa.dart';

class ControladorHamburguesa {

  // Validar que la cantidad sea un número entero positivo
  String? validarCantidad(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'La cantidad no puede estar vacía';
    }

    final int? cantidad = int.tryParse(valor);

    if (cantidad == null) {
      return 'Ingrese un número válido';
    }

    if (cantidad <= 0) {
      return 'La cantidad debe ser mayor a 0';
    }

    if (cantidad > 100) {
      return 'La cantidad no puede superar 100 hamburguesas por tipo';
    }

    return null;
  }

  // Validar que haya al menos un item en el pedido
  String? validarPedidoVacio(List<ItemHamburguesa> items) {
    if (items.isEmpty) {
      return 'Debe agregar al menos un tipo de hamburguesa';
    }
    return null;
  }

  // Validar que la cantidad total de hamburguesas no sea excesiva
  String? validarTotalHamburguesas(int total) {
    if (total <= 0) {
      return 'Debe pedir al menos una hamburguesa';
    }

    if (total > 500) {
      return 'No podemos procesar más de 500 hamburguesas por pedido';
    }

    return null;
  }

  // Obtener nombre del tipo de hamburguesa para mostrar
  String obtenerNombreTipo(TipoHamburguesa tipo) {
    switch (tipo) {
      case TipoHamburguesa.sencilla:
        return 'Sencilla';
      case TipoHamburguesa.doble:
        return 'Doble';
      case TipoHamburguesa.triple:
        return 'Triple';
    }
  }

  // Obtener precio del tipo de hamburguesa
  double obtenerPrecioTipo(TipoHamburguesa tipo) {
    switch (tipo) {
      case TipoHamburguesa.sencilla:
        return 20.0;
      case TipoHamburguesa.doble:
        return 25.0;
      case TipoHamburguesa.triple:
        return 28.0;
    }
  }

  // Crear un item de hamburguesa validado
  ItemHamburguesa? crearItemHamburguesa({
    required TipoHamburguesa tipo,
    required int cantidad,
  }) {
    if (cantidad <= 0) {
      return null;
    }

    return ItemHamburguesa(
      tipo: tipo,
      cantidad: cantidad,
    );
  }
}