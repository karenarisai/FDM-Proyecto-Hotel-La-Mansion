import 'package:flutter/material.dart';

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
    );
  }
}
