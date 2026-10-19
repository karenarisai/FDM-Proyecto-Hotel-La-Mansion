import 'package:flutter/material.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitaciones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _RoomTile(number: 101, type: 'Sencilla', status: 'Disponible'),
          _RoomTile(number: 102, type: 'Doble', status: 'Disponible'),
          _RoomTile(number: 103, type: 'Suite', status: 'En limpieza'),
        ],
      ),
    );
  }
}

class _RoomTile extends StatelessWidget {
  const _RoomTile({
    required this.number,
    required this.type,
    required this.status,
  });

  final int number;
  final String type;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.bed),
        title: Text('Habitación $number'),
        subtitle: Text('$type · $status'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                RoomDetailScreen(number: number, type: type, status: status),
          ),
        ),
      ),
    );
  }
}

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
    );
  }
}
