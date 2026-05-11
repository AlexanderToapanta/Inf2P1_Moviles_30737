import 'package:flutter/material.dart';

import '../atomos/inputNumero.dart';
import '../atomos/inputDecimalSigno.dart';
import '../atomos/botonPrimario.dart';

class FormularioConteoCantidades extends StatelessWidget {
  final TextEditingController cantidadController;
  final List<TextEditingController> valoresControllers;
  final VoidCallback onGenerar;
  final VoidCallback onCalcular;

  const FormularioConteoCantidades({
    super.key,
    required this.cantidadController,
    required this.valoresControllers,
    required this.onGenerar,
    required this.onCalcular,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputNumber(text: 'Cantidad de números (N)', controller: cantidadController),
        const SizedBox(height: 12),
        PrimaryButton(
          text: 'Generar campos',
          onPressed: onGenerar,
        ),
        if (valoresControllers.isNotEmpty) ...[
          const SizedBox(height: 20),
          const Text(
            'Ingrese las cantidades',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            valoresControllers.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InputDecimalSigno(
                text: 'Valor ${index + 1}',
                controller: valoresControllers[index],
              ),
            ),
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Calcular conteo',
            onPressed: onCalcular,
          ),
        ],
      ],
    );
  }
}