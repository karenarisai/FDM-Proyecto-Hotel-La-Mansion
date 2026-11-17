import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({
    required this.guestName,
    required this.roomNumber,
    required this.checkInDate,
    required this.checkOutDate,
    super.key,
  });

  final String guestName;
  final String roomNumber;
  final DateTime checkInDate;
  final DateTime checkOutDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE0EAF5),
          child: Icon(Icons.calendar_month, color: Color(0xFF023B90)),
        ),
        title: Text(
          guestName,
          style: const TextStyle(
            color: Color(0xFF172033),
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          'Habitación $roomNumber  ·  '
          '${checkInDate.toLocal().toString().split(' ')[0]} - '
          '${checkOutDate.toLocal().toString().split(' ')[0]}',
          style: const TextStyle(color: Color(0xFF687384), fontSize: 12),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFF023B90)),
      ),
    );
  }
}
