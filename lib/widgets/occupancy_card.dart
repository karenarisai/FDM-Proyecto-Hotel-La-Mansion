import 'package:flutter/material.dart';

class OccupancyCard extends StatelessWidget {
  const OccupancyCard({
    this.occupied = 32,
    this.total = 40,
    this.availableLabel = 'habitaciones libres',
    super.key,
  });

  final int occupied;
  final int total;
  final String availableLabel;

  @override
  Widget build(BuildContext context) {
    final available = total - occupied;
    final percentage = total == 0 ? 0.0 : occupied / total;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x16023B90),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ocupación Actual',
                  style: TextStyle(
                    color: Color(0xFF6980A5),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$occupied/$total',
                  style: const TextStyle(
                    color: Color(0xFF023B90),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Color(0xFF20BE69),
                      size: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$available $availableLabel',
                      style: const TextStyle(color: Color(0xFF687384)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 78,
            height: 78,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 7,
                  backgroundColor: const Color(0xFFE9EEF6),
                  color: const Color(0xFF023B90),
                ),
                Text(
                  '${(percentage * 100).round()}%',
                  style: const TextStyle(
                    color: Color(0xFF023B90),
                    fontWeight: FontWeight.w800,
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
