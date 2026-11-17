import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    required this.roomNumber,
    required this.roomType,
    required this.roomStatus,
    required this.roomStatusColor,
    this.roomPrice, 
    this.onTap, // opcional
    super.key,
  });

  final String roomNumber;
  final String roomType;
  final String roomStatus;
  final Color roomStatusColor;
  final double? roomPrice;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
   return Card(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: const Icon(
          Icons.bed, size: 32,
          color: Color(0xFF023B90),
          ),
        title: Text('Habitación $roomNumber',
            style: const TextStyle(fontWeight: FontWeight.bold, )
            ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onTap,
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: onTap,
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(roomType),
            if (roomPrice != null) Text('Precio: $roomPrice'),
            Text(
              roomStatus,
              style: TextStyle(color: roomStatusColor),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}