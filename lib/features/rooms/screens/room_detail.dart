import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({
    required this.number,
    required this.type,
    required this.status,
    super.key,
  });

  final int number;
  final String type;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habitación $number')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.bed, size: 32),
              title: Text('Habitación $number'),
              subtitle: Text(type),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Estado'),
              subtitle: Text(status),
            ),
          ),
        ],
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
