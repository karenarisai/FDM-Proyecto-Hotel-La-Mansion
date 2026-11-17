import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';

class OccupancyScreen extends StatelessWidget {
  const OccupancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ocupación')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.hotel),
              title: Text('Habitaciones ocupadas'),
              subtitle: Text('0 habitaciones'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.bed),
              title: Text('Habitaciones disponibles'),
              subtitle: Text('40 habitaciones'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 4,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      1 => const RoomsScreen(),
      2 => const ClientesScreen(),
      3 => const ReservationsScreen(),
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
