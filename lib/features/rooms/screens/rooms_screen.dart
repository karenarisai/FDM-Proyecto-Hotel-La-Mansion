import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';
import 'package:hotel_la_mansion/features/rooms/widgets/room_card.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {

  void _showAddRoomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Agregar nueva habitación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Número de habitación'),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Tipo de habitación'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Color del texto
              backgroundColor: Color(0xFF023B90),  // Color de fondo
              ),
              onPressed: () {
                // Aquí puedes agregar la lógica para guardar la nueva habitación
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
   
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitaciones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RoomCard(
            roomNumber: '101',
            roomType: 'Sencilla',
            roomStatus: 'Disponible',
            roomStatusColor: Colors.green,
          ),
          const SizedBox(height: 12),
          RoomCard(
            roomNumber: '102',
            roomType: 'Doble',
            roomStatus: 'Disponible',
            roomStatusColor: Colors.green,
          ),
          const SizedBox(height: 12),
          RoomCard(
            roomNumber: '103',
            roomType: 'Suite',
            roomStatus: 'En limpieza',
            roomStatusColor: Colors.orange,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddRoomDialog,
        icon: const Icon(Icons.add),
        label: const Text('Nueva habitación'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF023B90),
      ),
      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      2 => const ClientesScreen(),
      3 => const ReservationsScreen(),
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
}
