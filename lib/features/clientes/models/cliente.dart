class Cliente {
  const Cliente({
    required this.nombre,
    required this.numeroDocumento,
    required this.telefono,
    required this.correo,
    required this.nacionalidad,
  });

  final String nombre;
  final String numeroDocumento;
  final String telefono;
  final String correo;
  final String nacionalidad;
}
