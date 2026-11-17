import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/screens/clientes_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';
import 'package:hotel_la_mansion/features/rooms/widgets/room_card.dart';
import 'package:hotel_la_mansion/features/rooms/services/local_room_service.dart';
import 'package:hotel_la_mansion/features/rooms/models/room_model.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final LocalRoomService _dbService = LocalRoomService();

  List<RoomModel> _rooms = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  void _loadRooms() async {
    setState(() {
      _isLoading = true;
    });

    final rooms = await _dbService.getRooms();

    setState(() {
      _rooms = rooms;
      _isLoading = false;
    });
  }

  void _showAddRoomDialog() {
    final roomNumberController = TextEditingController();
    final roomDescriptionController = TextEditingController();
    final roomPriceController = TextEditingController();
    final roomAvailabilityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar Habitación'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: roomNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número de Habitación'),
            ),
            TextField(
              controller: roomDescriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción de la Habitación',
              ),
            ),
            TextField(
              controller: roomPriceController,
              keyboardType: TextInputType.number, 
              decoration: InputDecoration(labelText: 'Precio de la Habitación'),
            ),
            TextField(
              controller: roomAvailabilityController,
              decoration: InputDecoration(
                labelText: 'Disponibilidad de la Habitación',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final price = double.tryParse(roomPriceController.text.trim());

              if (roomNumberController.text.isNotEmpty &&
                  roomDescriptionController.text.isNotEmpty &&
                  price != null &&
                  roomAvailabilityController.text.isNotEmpty) {
                final newRoom = RoomModel(
                  number: roomNumberController.text,
                  description: roomDescriptionController.text,
                  price: price,
                  isAvailable:
                      roomAvailabilityController.text.trim().toLowerCase() ==
                      'disponible',
                );

                await _dbService.insertRoom(newRoom);
                if (!mounted) return;
                Navigator.pop(context);
                _loadRooms();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Por favor, complete todos los campos correctamente.',
                    ),
                  ),
                );
              }
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteRoom(int roomId) async {
    await _dbService.deleteRoom(roomId);

    if (mounted) {
      _loadRooms();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Habitación eliminada correctamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitaciones')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _rooms.isEmpty
          ? Center(child: Text('No hay habitaciones disponibles.'))
          : ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                final room = _rooms[index];
                return RoomCard(
                  roomNumber: room.number,
                  roomType: room.description,
                  roomPrice: room.price,
                  roomStatus: room.isAvailable ? 'Disponible' : 'No disponible',
                  roomStatusColor: room.isAvailable ? Colors.green : Colors.red,
                );
              },
            ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddRoomDialog,
        icon: const Icon(Icons.add),
        label: const Text('Nueva habitación'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF023B90),
      ),
      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      2 => const ClientesScreen(),
      3 => const ReservationsScreen(),
      4 => const FinancesScreen(),
      _ => null,
    };
    if (screen != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => screen),
      );
    }
  }
}
