import 'package:flutter/material.dart';
import '../atomos/textoResultado.dart';

class ResumenPedidoHamburguesa extends StatelessWidget {
  final Map<String, dynamic> resumen;
  final bool pagaConTarjeta;
  final ValueChanged<bool?> onCambioTarjeta;

   ResumenPedidoHamburguesa({
    super.key,
    required this.resumen,
    required this.pagaConTarjeta,
    required this.onCambioTarjeta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin:  EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Resumen del Pedido",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ResultText(text: "Subtotal: \$${resumen['subtotal'].toStringAsFixed(2)}"),
            
            Row(
              children: [
                Text("Pago con Tarjeta (+5%)", style: TextStyle(fontSize: 16)),
                Checkbox(
                  value: pagaConTarjeta,
                  onChanged: onCambioTarjeta,
                ),
              ],
            ),

            if (pagaConTarjeta)
              Text(
                "Cargo por Tarjeta: +\$${resumen['cargoTarjeta'].toStringAsFixed(2)}",
                style: TextStyle(color: Colors.orange, fontSize: 18),
              ),
            
             Divider(),
            Text(
              "TOTAL A PAGAR: \$${resumen['total'].toStringAsFixed(2)}",
              style:  TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
