import 'package:flutter/material.dart';
import '../atomos/botonPrimario.dart';

class MenuEjercicios extends StatelessWidget {
  const MenuEjercicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: 'Problema 1',
          onPressed: () => Navigator.pushNamed(context, '/problema1'),
        ),
        const SizedBox(height: 10),
        Text("Problemas 2"),
        const SizedBox(height: 10),
        PrimaryButton(
          text: 'Ejercicio 4.1',
          onPressed: () => Navigator.pushNamed(context, '/ejercicio4.1'),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: 'Ejercicio 4.2',
          onPressed: () => Navigator.pushNamed(context, '/ejercicio4.2'),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: 'Ejercicio 4.3',
          onPressed: () => Navigator.pushNamed(context, '/ejercicio4.3'),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          text: 'Ejercicio 4.8',
          onPressed: () => Navigator.pushNamed(context, '/ejercicio4.8'),
        ),
      ],
    );
  }
}
