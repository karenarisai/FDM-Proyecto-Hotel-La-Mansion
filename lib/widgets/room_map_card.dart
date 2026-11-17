import 'package:flutter/material.dart';

class RoomMapCard extends StatelessWidget {
  const RoomMapCard({
    this.rooms = const [
      0,
      0,
      1,
      0,
      0,
      2,
      0,
      1,
      1,
      0,
      0,
      1,
      0,
      0,
      2,
      0,
      1,
      0,
      0,
      0,
      0,
      1,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
    ],
    super.key,
  });

  final List<int> rooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12023B90),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              _LegendDot(color: Color(0xFF20BE69), label: 'LIBRE'),
              Spacer(),
              _LegendDot(color: Color(0xFF023B90), label: 'OCUPADA'),
              Spacer(),
              _LegendDot(color: Color(0xFFFF8B3D), label: 'ASEO'),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFE8ECF1)),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: rooms.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              crossAxisSpacing: 8,
              mainAxisSpacing: 9,
              childAspectRatio: 1,
            ),
            itemBuilder: (_, index) {
              final color = switch (rooms[index]) {
                1 => const Color(0xFF20BE69),
                2 => const Color(0xFFFF8B3D),
                _ => const Color(0xFF023B90),
              };
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF586273),
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
