enum EstadoReserva { confirmada, activa, finalizada, cancelada }

class Reservation {
  Reservation({
    required this.nombreCliente,
    required this.numeroHabitacion,
    required this.entrada,
    required this.salida,
    required this.estado,
    required this.total,
  });

  final String nombreCliente;
  final int numeroHabitacion;
  final DateTime entrada;
  final DateTime salida;
  final EstadoReserva estado;
  final double total;

  String get etiquetaEstado {
    switch (estado) {
      case EstadoReserva.confirmada:
        return 'Confirmada';
      case EstadoReserva.activa:
        return 'Activa';
      case EstadoReserva.finalizada:
        return 'Finalizada';
      case EstadoReserva.cancelada:
        return 'Cancelada';
    }
  }
}
