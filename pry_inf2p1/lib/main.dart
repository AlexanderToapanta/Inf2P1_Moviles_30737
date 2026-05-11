import 'package:flutter/material.dart';
import 'vista/paginas/principal.dart';
import 'vista/paginas/vistaSalarioProfesor.dart';
import 'vista/paginas/vista_articulos_promocion.dart';
import 'vista/paginas/vista_ventas.dart';
import 'vista/paginas/vista_hamburguesas.dart';
import 'vista/paginas/vista_conteo_cantidades.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 2.1 - ESPE',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        '/problema1': (context) => VistaVentas(),
        // Rutas definidas en MenuEjercicios (Pendientes de implementación)
        '/ejercicio4.1': (context) => const VistaSalarioProfesor(),
        '/ejercicio4.2': (context) => const VistaHamburguesas(),
        '/ejercicio4.3': (context) => const VistaConteoCantidades(),
        '/ejercicio4.8': (context) => const VistaArticulosPromocion(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
