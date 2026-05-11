class ConteoCantidades {
  final int ceros;
  final int menoresCero;
  final int mayoresCero;

  const ConteoCantidades({
    required this.ceros,
    required this.menoresCero,
    required this.mayoresCero,
  });

  int get total => ceros + menoresCero + mayoresCero;
}