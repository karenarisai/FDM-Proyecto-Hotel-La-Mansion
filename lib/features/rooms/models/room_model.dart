class RoomModel {
  final int? id;
  final String number;
  final String description;
  final double price;
  final bool isAvailable;

  RoomModel({
    this.id,
    required this.number,
    required this.description,
    required this.price,
    this.isAvailable = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'description': description,
      'price': price,
      'isAvailable': isAvailable ? 1 : 0,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] as int?,
      number: map['number'].toString(),
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      isAvailable: map['isAvailable'] == 1,
    );
  }

  RoomModel copyWith({
    int? id,
    String? number,
    String? description,
    double? price,
    bool? isAvailable,
  }) {
    return RoomModel(
      id: id ?? this.id,
      number: number ?? this.number,
      description: description ?? this.description,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}