import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/reservations/models/reservation.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  final List<Reservation> _reservations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _reservations.isEmpty
            ? [
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text('No hay reservas registradas'),
                    subtitle: Text('Aquí aparecerán las reservas del hotel.'),
                  ),
                ),
              ]
            : _reservations.map(_reservationCard).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showNewReservationDialog,
        icon: const Icon(Icons.add),
        label: const Text('Nueva reserva'),
      ),
    );
  }

  Widget _reservationCard(Reservation reservation) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_month),
        title: Text(reservation.nombreCliente),
        subtitle: Text(
          'Habitación ${reservation.numeroHabitacion} · ${reservation.etiquetaEstado}',
        ),
      ),
    );
  }

  void _showNewReservationDialog() {
    String nombreCliente = '';
    int habitacionSeleccionada = 101;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Nueva reserva'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre del cliente',
                    hintText: 'Ejemplo: Karen García',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  onChanged: (value) => nombreCliente = value,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  initialValue: habitacionSeleccionada,
                  decoration: const InputDecoration(
                    labelText: 'Habitación',
                    prefixIcon: Icon(Icons.bed_outlined),
                  ),
                  items: [101, 102, 103]
                      .map(
                        (room) => DropdownMenuItem<int>(
                          value: room,
                          child: Text('Habitación $room'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => habitacionSeleccionada = value);
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () {
                  if (nombreCliente.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Escribe el nombre del cliente'),
                      ),
                    );
                    return;
                  }

                  final checkIn = DateTime.now();
                  setState(() {
                    _reservations.add(
                      Reservation(
                        nombreCliente: nombreCliente.trim(),
                        numeroHabitacion: habitacionSeleccionada,
                        entrada: checkIn,
                        salida: checkIn.add(const Duration(days: 1)),
                        estado: EstadoReserva.confirmada,
                        total: 0,
                      ),
                    );
                  });

                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Reserva agregada correctamente'),
                    ),
                  );
                },
                child: const Text('Agregar'),
              ),
            ],
          );
        },
      ),
    );
  }
}
