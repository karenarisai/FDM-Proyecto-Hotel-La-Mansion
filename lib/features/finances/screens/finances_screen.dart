import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {

  void _showAddFinanceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Agregar nuevo movimiento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Monto'),
                keyboardType: TextInputType.number,
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
                // Aquí puedes agregar la lógica para guardar el nuevo movimiento
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
      appBar: AppBar(title: const Text('Finanzas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _BalanceCard(),
          SizedBox(height: 16),
          _FinanceItem(
            icon: Icons.trending_up,
            title: 'Ingresos del día',
            amount: '\$12,450.00',
            color: Color(0xFF20BE69),
          ),
          _FinanceItem(
            icon: Icons.trending_down,
            title: 'Gastos del día',
            amount: '\$2,180.00',
            color: Color(0xFFFF762D),
          ),
          _FinanceItem(
            icon: Icons.calendar_month,
            title: 'Reservas confirmadas',
            amount: '8 reservas',
            color: Color(0xFF023B90),
          ),
        ],
      ),

   floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddFinanceDialog,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo movimiento'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF023B90),
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
      4 => null,
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

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF023B90),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance del día',
            style: TextStyle(color: Color(0xFFDCE7F8), fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            '\$10,270.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _FinanceItem extends StatelessWidget {
  const _FinanceItem({
    required this.icon,
    required this.title,
    required this.amount,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: .1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF172033),
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Text(
          amount,
          style: TextStyle(color: color, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
