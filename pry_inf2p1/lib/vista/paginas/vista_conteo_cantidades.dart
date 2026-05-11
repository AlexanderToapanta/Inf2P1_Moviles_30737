import 'package:flutter/material.dart';

import '../../controlador/controlador_conteo_cantidades.dart';
import '../../modelo/modelo_conteo_cantidades.dart';
import '../atomos/botonVolver.dart';
import '../atomos/textoResultado.dart';
import '../moleculas/formularioConteoCantidades.dart';

class VistaConteoCantidades extends StatefulWidget {
  const VistaConteoCantidades({super.key});

  @override
  State<VistaConteoCantidades> createState() => _VistaConteoCantidadesState();
}

class _VistaConteoCantidadesState extends State<VistaConteoCantidades> {
  final ControladorConteoCantidades _controlador = ControladorConteoCantidades();
  final TextEditingController _cantidadController = TextEditingController();
  final List<TextEditingController> _valoresControllers = [];

  String _resultado = 'Ingrese N y genere los campos para comenzar.';

  @override
  void dispose() {
    _cantidadController.dispose();
    for (final controller in _valoresControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _limpiarCamposGenerados() {
    for (final controller in _valoresControllers) {
      controller.dispose();
    }
    _valoresControllers.clear();
  }

  void _generarCampos() {
    final error = _controlador.validarN(_cantidadController.text);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
      return;
    }

    final int cantidad = int.parse(_cantidadController.text);

    setState(() {
      _limpiarCamposGenerados();
      for (var index = 0; index < cantidad; index++) {
        _valoresControllers.add(TextEditingController());
      }
      _resultado = 'Se generaron $cantidad campos. Ingrese los valores y calcule.';
    });
  }

  void _calcularConteo() {
    if (_valoresControllers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Primero genere los campos de entrada')),
      );
      return;
    }

    final valores = <double>[];

    for (var index = 0; index < _valoresControllers.length; index++) {
      final texto = _valoresControllers[index].text;
      final error = _controlador.validarValor(texto);
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Valor ${index + 1}: $error')),
        );
        return;
      }

      valores.add(double.parse(texto));
    }

    final ConteoCantidades resumen = _controlador.contar(valores);

    setState(() {
      _resultado =
          'Resultados:\n'
          'Ceros: ${resumen.ceros}\n'
          'Menores a cero: ${resumen.menoresCero}\n'
          'Mayores a cero: ${resumen.mayoresCero}\n'
          'Total procesado: ${resumen.total}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4.3'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Conteo de valores positivos, negativos y ceros',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ingrese N, genere los campos y luego escriba cada cantidad para obtener el conteo.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                FormularioConteoCantidades(
                  cantidadController: _cantidadController,
                  valoresControllers: _valoresControllers,
                  onGenerar: _generarCampos,
                  onCalcular: _calcularConteo,
                ),
                const SizedBox(height: 20),
                ResultText(text: _resultado),
                const SizedBox(height: 20),
                const BotonVolver(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}