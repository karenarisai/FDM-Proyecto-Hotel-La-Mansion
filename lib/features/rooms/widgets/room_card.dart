import 'package:flutter/material.dart';


class RoomCard extends StatelessWidget {
  const RoomCard({
    required this.roomNumber,
    required this.roomType,
    required this.roomStatus,
    required this.roomStatusColor,
    super.key,
  });

  final String roomNumber;
  final String roomType;
  final String roomStatus;
  final Color roomStatusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12023B90),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE0EAF5),
            child: Text(
              roomNumber,
              style: const TextStyle(
                color: Color(0xFF023B90),
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomType,
                  style: const TextStyle(
                    color: Color(0xFF172033),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  roomStatus,
                  style: TextStyle(
                    color: roomStatusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}