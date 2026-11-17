import 'package:flutter/material.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({
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