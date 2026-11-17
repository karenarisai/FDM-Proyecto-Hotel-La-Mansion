import 'package:flutter/material.dart';

class SmallMetricCard extends StatelessWidget {
  const SmallMetricCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.detail,
    this.detailColor = const Color(0xFF6980A5),
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String detail;
  final Color detailColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12023B90),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: iconColor, size: 21),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(color: Color(0xFF687384), fontSize: 12),
          ),
          const SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF023B90),
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 7),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  detail,
                  style: TextStyle(color: detailColor, fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
