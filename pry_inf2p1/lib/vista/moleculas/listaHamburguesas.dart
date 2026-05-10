import 'package:flutter/material.dart';
import '../../modelo/modelo_hamburguesa.dart';
import '../../controlador/controlador_hamburguesa.dart';

class ListaHamburguesas extends StatelessWidget {
  final List<ItemHamburguesa> items;
  final Function(int) onEliminar;
  final ControladorHamburguesa controlador = ControladorHamburguesa();

  ListaHamburguesas({
    super.key,
    required this.items,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return  Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("No hay hamburguesas en el pedido."),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics:  NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final nombre = controlador.obtenerNombreTipo(item.tipo);
        final precio = controlador.obtenerPrecioTipo(item.tipo);
        
        return ListTile(
          title: Text("Hamburguesa $nombre"),
          subtitle: Text("Cant: ${item.cantidad} x \$${precio.toStringAsFixed(2)}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("\$${item.calcularSubtotal().toStringAsFixed(2)}", 
                style:  TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon:  Icon(Icons.delete, color: Colors.red),
                onPressed: () => onEliminar(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
