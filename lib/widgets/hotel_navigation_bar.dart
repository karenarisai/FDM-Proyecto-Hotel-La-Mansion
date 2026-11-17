import 'package:flutter/material.dart';

class HotelNavigationBar extends StatelessWidget {
  const HotelNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.bed_outlined),
          selectedIcon: Icon(Icons.bed),
          label: 'Habitaciones',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: 'Huéspedes',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: 'Reservas',
        ),
        NavigationDestination(
          icon: Icon(Icons.show_chart),
          selectedIcon: Icon(Icons.show_chart),
          label: 'Finanzas',
        ),
      ],
    );
  }
}
