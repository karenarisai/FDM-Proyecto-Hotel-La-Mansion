class Cliente {
  final int? id;
  final String nombre;
  final String numeroDocumento;
  final String telefono;
  final String correoElectronico;

  Cliente({
    this.id,
    required this.nombre,
    required this.numeroDocumento,
    required this.telefono,
    required this.correoElectronico,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'numero_documento': numeroDocumento,
      'telefono': telefono,
      'correo_electronico': correoElectronico,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nombre: map['nombre'],
      numeroDocumento: map['numero_documento'],
      telefono: map['telefono'],
      correoElectronico: map['correo_electronico'],
    );
  }
}
