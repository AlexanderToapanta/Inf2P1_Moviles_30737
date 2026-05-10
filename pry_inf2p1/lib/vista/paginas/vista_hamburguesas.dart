import 'package:flutter/material.dart';
import '../../modelo/modelo_hamburguesa.dart';
import '../../controlador/controlador_hamburguesa.dart';
import '../moleculas/formularioHamburguesa.dart';
import '../moleculas/listaHamburguesas.dart';
import '../moleculas/resumenPedidoHamburguesa.dart';
import '../atomos/botonVolver.dart';

class VistaHamburguesas extends StatefulWidget {
  const VistaHamburguesas({super.key});

  @override
  State<VistaHamburguesas> createState() => _VistaHamburguesasState();
}

class _VistaHamburguesasState extends State<VistaHamburguesas> {
  final List<ItemHamburguesa> _items = [];
  bool _pagaConTarjeta = false;
  final ControladorHamburguesa _controlador = ControladorHamburguesa();

  void _agregarHamburguesa(TipoHamburguesa tipo, int cantidad) {
    setState(() {
      // Si ya existe el tipo en la lista, sumamos la cantidad
      int index = _items.indexWhere((item) => item.tipo == tipo);
      if (index != -1) {
        _items[index].cantidad += cantidad;
      } else {
        _items.add(ItemHamburguesa(tipo: tipo, cantidad: cantidad));
      }
    });
  }

  void _eliminarItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pedidoModel = PedidoHamburguesaModel(
      items: _items,
      pagaConTarjeta: _pagaConTarjeta,
    );
    final resumen = pedidoModel.obtenerResumenPedido();

    return Scaffold(
      appBar: AppBar(
        title: Text("El Náufrago Satisfecho"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormularioHamburguesa(onAgregar: _agregarHamburguesa),
            SizedBox(height: 20),
             Text(
              "Detalle del Pedido:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Divider(),
            ListaHamburguesas(
              items: _items,
              onEliminar: _eliminarItem,
            ),
            if (_items.isNotEmpty) ...[
              ResumenPedidoHamburguesa(
                resumen: resumen,
                pagaConTarjeta: _pagaConTarjeta,
                onCambioTarjeta: (valor) {
                  setState(() {
                    _pagaConTarjeta = valor ?? false;
                  });
                },
              ),
            ],
            SizedBox(height: 20),
             BotonVolver(),
          ],
        ),
      ),
    );
  }
}
