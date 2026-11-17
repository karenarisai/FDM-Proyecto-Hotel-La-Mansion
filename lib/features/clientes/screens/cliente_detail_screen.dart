import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/models/cliente.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';

class ClienteDetailScreen extends StatelessWidget {
  const ClienteDetailScreen({required this.cliente, super.key});

  final Cliente cliente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cliente.nombre)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _DetailItem(
            icon: Icons.person_outline,
            title: 'Nombre',
            value: cliente.nombre,
          ),
          _DetailItem(
            icon: Icons.badge_outlined,
            title: 'Documento',
            value: cliente.numeroDocumento,
          ),
          _DetailItem(
            icon: Icons.phone_outlined,
            title: 'Teléfono',
            value: cliente.telefono,
          ),
          _DetailItem(
            icon: Icons.email_outlined,
            title: 'Correo',
            value: cliente.correoElectronico,
          ),
        ],
      ),
      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      1 => const RoomsScreen(),
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

class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF023B90)),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF6980A5),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          value.isEmpty ? 'No registrado' : value,
          style: const TextStyle(
            color: Color(0xFF172033),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
