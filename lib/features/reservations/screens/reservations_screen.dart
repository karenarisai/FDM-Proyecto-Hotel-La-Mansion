import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/models/reservation.dart';
import 'package:hotel_la_mansion/features/reservations/widgets/reservation_card.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';

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
      appBar: AppBar(title: Text('Reservas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _reservations.isEmpty
            ? [
                Card(
                  color: Colors.white,
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
        label: Text('Nueva reserva'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF023B90),
      ),
      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 3,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  Widget _reservationCard(Reservation reservation) {
    return ReservationCard(
      guestName: reservation.nombreCliente,
      roomNumber: reservation.numeroHabitacion.toString(),
      checkInDate: reservation.entrada,
      checkOutDate: reservation.salida,
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      1 => const RoomsScreen(),
      2 => const ClientesScreen(),
      4 => const FinancesScreen(),
      _ => null,
    };
    if (screen != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => screen),
      );
    }
  }

  void _showNewReservationDialog() {
    String nombreCliente = '';
    int habitacionSeleccionada = 101;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            backgroundColor: Colors.white,
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
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Color del texto
                  backgroundColor: Color(0xFF023B90),  // Color de fondo
                ),
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () {
                  if (nombreCliente.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
