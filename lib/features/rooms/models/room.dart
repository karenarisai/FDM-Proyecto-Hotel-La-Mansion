enum RoomType { single, double, suite }

enum RoomStatus { available, occupied, cleaning }

class Room {
  const Room({
    required this.number,
    required this.type,
    required this.pricePerNight,
    required this.status,
  });

  final int number;
  final RoomType type;
  final double pricePerNight;
  final RoomStatus status;

  String get typeLabel {
    switch (type) {
      case RoomType.single:
        return 'Sencilla';
      case RoomType.double:
        return 'Doble';
      case RoomType.suite:
        return 'Suite';
    }
  }

  String get statusLabel {
    switch (status) {
      case RoomStatus.available:
        return 'Disponible';
      case RoomStatus.occupied:
        return 'Ocupada';
      case RoomStatus.cleaning:
        return 'En limpieza';
    }
  }
}
