import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';
import 'package:hotel_la_mansion/widgets/occupancy_card.dart';
import 'package:hotel_la_mansion/widgets/reservation_tile.dart';
import 'package:hotel_la_mansion/widgets/revenue_card.dart';
import 'package:hotel_la_mansion/widgets/room_map_card.dart';
import 'package:hotel_la_mansion/widgets/section_title.dart';
import 'package:hotel_la_mansion/widgets/small_metric_card.dart';
import 'package:hotel_la_mansion/features/auth/screens/login_screen.dart';
import 'package:hotel_la_mansion/core/storage/local_storage_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF3E1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 100),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado del Dashboard
              Row(
                children: [
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        const Text(
                          'Hola, Recepcionista',
                          style: TextStyle(
                            color: Color(0xFF023B90),
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat(
                            'EEEE, d MMMM yyyy',
                            'es',
                          ).format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.blueGrey.shade500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _logout,
                    tooltip: 'Cerrar sesión',
                    icon: Icon(Icons.logout, color: Colors.red.shade700),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const OccupancyCard(),
              const SizedBox(height: 16),

              const Row(
                children: [
                  Expanded(
                    child: SmallMetricCard(
                      icon: Icons.login_rounded,
                      iconColor: Color(0xFF023B90),
                      title: 'Check-ins hoy',
                      value: '5',
                      detail: 'pendientes',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SmallMetricCard(
                      icon: Icons.logout_rounded,
                      iconColor: Color(0xFFFF762D),
                      title: 'Check-outs hoy',
                      value: '3',
                      detail: 'realizados',
                      detailColor: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const RevenueCard(),
              const SizedBox(height: 30),

              SectionTitle(
                title: 'Mapa de Habitaciones',
                action: 'Ver todos',
                onTap: () => _openScreen(const RoomsScreen()),
              ),

              const SizedBox(height: 14),
              const RoomMapCard(),
              const SizedBox(height: 30),

              const Text(
                'Reservas Recientes',
                style: TextStyle(
                  color: Color(0xFF023B90),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 14),

              const ReservationTile(
                initials: 'CM',
                name: 'Carlos Mendoza',
                details: 'Habitante 204 · King Suite',
                status: 'CONFIRMADA',
                statusColor: Color(0xFFD8F6E2),
                statusTextColor: Color(0xFF168447),
              ),

              const SizedBox(height: 12),

              const ReservationTile(
                initials: 'LF',
                name: 'Lucía Fernández',
                details: 'Habitante 102 · Doble Estándar',
                status: 'ACTIVA',
                statusColor: Color(0xFFDCEAFF),
                statusTextColor: Color(0xFF0753A7),
              ),

              const SizedBox(height: 12),

              const ReservationTile(
                initials: 'RG',
                name: 'Roberto Gómez',
                details: 'Habitante 401 · Junior Suite',
                status: 'CONFIRMADA',
                statusColor: Color(0xFFD8F6E2),
                statusTextColor: Color(0xFF168447),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);

          if (index == 1) {
            _openScreen(const RoomsScreen());
          } else if (index == 2) {
            _openScreen(const ClientesScreen());
          } else if (index == 3) {
            _openScreen(const ReservationsScreen());
          } else if (index == 4) {
            _openScreen(const FinancesScreen());
          }
        },
      ),
    );
  }

  void _openScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Future<void> _logout() async {
    final storage = LocalStorageService();
    await storage.deleteToken();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
