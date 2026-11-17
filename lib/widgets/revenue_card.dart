import 'package:flutter/material.dart';

class RevenueCard extends StatelessWidget {
  const RevenueCard({
    this.label = 'Ingresos del día',
    this.amount = '\$12,450.00',
    super.key,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF023B90),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              color: Color(0xFF2459A5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.attach_money_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFDCE7F8),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}
