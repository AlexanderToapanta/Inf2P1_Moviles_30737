import 'package:flutter/material.dart';
import '../../modelo/modelo_hamburguesa.dart';
import '../atomos/inputNumero.dart';
import '../atomos/botonPrimario.dart';

class FormularioHamburguesa extends StatefulWidget {
  final Function(TipoHamburguesa, int) onAgregar;

   FormularioHamburguesa({super.key, required this.onAgregar});

  @override
  State<FormularioHamburguesa> createState() => _FormularioHamburguesaState();
}

class _FormularioHamburguesaState extends State<FormularioHamburguesa> {
  TipoHamburguesa _tipoSeleccionado = TipoHamburguesa.sencilla;
  final TextEditingController _cantidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Seleccione el Tipo de Hamburguesa:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        DropdownButton<TipoHamburguesa>(
          value: _tipoSeleccionado,
          isExpanded: true,
          onChanged: (TipoHamburguesa? nuevoTipo) {
            if (nuevoTipo != null) {
              setState(() {
                _tipoSeleccionado = nuevoTipo;
              });
            }
          },
          items:  [
            DropdownMenuItem(value: TipoHamburguesa.sencilla, child: Text("Sencilla (\$20)")),
            DropdownMenuItem(value: TipoHamburguesa.doble, child: Text("Doble (\$25)")),
            DropdownMenuItem(value: TipoHamburguesa.triple, child: Text("Triple (\$28)")),
          ],
        ),
         SizedBox(height: 10),
        InputNumber(text: "Cantidad", controller: _cantidadController),
       SizedBox(height: 15),
        PrimaryButton(
          text: "Agregar al Pedido",
          onPressed: () {
            final int? cantidad = int.tryParse(_cantidadController.text);
            if (cantidad != null && cantidad > 0) {
              widget.onAgregar(_tipoSeleccionado, cantidad);
              _cantidadController.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Ingrese una cantidad válida")),
              );
            }
          },
        ),
      ],
    );
  }
}
