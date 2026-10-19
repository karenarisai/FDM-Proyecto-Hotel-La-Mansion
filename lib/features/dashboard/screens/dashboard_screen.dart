import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/occupancy/screens/occupancy_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel La Mansión')),
      body: const _HomeTab(),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Resumen del hotel',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        _SummaryCard(
          icon: Icons.bed,
          title: 'Habitaciones',
          value: '40 habitaciones',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RoomsScreen()),
          ),
        ),
        _SummaryCard(
          icon: Icons.hotel,
          title: 'Ocupación',
          value: '0 habitaciones ocupadas',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OccupancyScreen()),
          ),
        ),
        _SummaryCard(
          icon: Icons.calendar_month,
          title: 'Reservas',
          value: 'Sin reservas registradas',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ReservationsScreen()),
          ),
        ),
        _SummaryCard(
          icon: Icons.people,
          title: 'Clientes',
          value: '0 clientes registrados',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ClientesScreen()),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(value),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
