import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/models/cliente.dart';
import 'package:hotel_la_mansion/features/clientes/screens/cliente_detail_screen.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';
import 'package:hotel_la_mansion/features/finances/screens/finances_screen.dart';
import 'package:hotel_la_mansion/features/reservations/screens/reservations_screen.dart';
import 'package:hotel_la_mansion/features/rooms/screens/rooms_screen.dart';
import 'package:hotel_la_mansion/widgets/hotel_navigation_bar.dart';
import 'package:hotel_la_mansion/features/clientes/widgets/cliente_card.dart';
import '../services/local_cliente_service.dart';


class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final LocalClienteService _dbService = LocalClienteService();

  final List<Cliente> _clientes = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadClientes();
  }

  void _showAddClienteDialog() {
    final nombreController = TextEditingController();
    final numeroDocumentoController = TextEditingController();
    final telefonoController = TextEditingController();
    final correoElectronicoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
          title: Text('Agregar Cliente'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: numeroDocumentoController,
                  decoration: InputDecoration(labelText: 'Número de Documento'),
                ),
                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Teléfono'),
                ),
                TextField(
                  controller: correoElectronicoController,
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
              ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
             onPressed: () async{
              if (nombreController.text.isNotEmpty &&
                  numeroDocumentoController.text.isNotEmpty &&
                  telefonoController.text.isNotEmpty &&
                  correoElectronicoController.text.isNotEmpty) {
                final newCliente = Cliente(
                  nombre: nombreController.text,
                  numeroDocumento: numeroDocumentoController.text,
                  telefono: telefonoController.text,
                  correoElectronico: correoElectronicoController.text,
                );
                await _dbService.insertCliente(newCliente);
                if(!mounted) return;
                Navigator.pop(context);
                _loadClientes();
              } else {
                // Show an error message or handle the empty fields case
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Por favor, complete todos los campos.')
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

  void _loadClientes() async {
    setState(() {
      _isLoading = true;
    });

    final clientes = await _dbService.getClientes();
    setState(() {
      _clientes.addAll(clientes);
      _isLoading = false;
    });
  }

  Future<void> _addCliente(Cliente cliente) async {
    await _dbService.insertCliente(cliente);
    setState(() {
      _clientes.add(cliente);
    });
  }

  Future<void> _updateCliente(Cliente cliente) async {
    await _dbService.updateWorkout(cliente);
    setState(() {
      final index = _clientes.indexWhere((c) => c.id == cliente.id);
      if (index != -1) {
        _clientes[index] = cliente;
      }
    });
  }

  Future<void> _deleteCliente(int id) async {
    await _dbService.deleteWorkout(id);
    setState(() {
      _clientes.removeWhere((c) => c.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes')
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _clientes.isEmpty
          ? Center(child: Text('No hay clientes registrados.'))
          :
          ListView.builder(
            itemCount: _clientes.length,
            itemBuilder: (context, index) {
              final cliente = _clientes[index];
            
              return ClienteCard(
                nombre: cliente.nombre,
                apellido: '',
                email: cliente.correoElectronico,
                telefono: cliente.telefono,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClienteDetailScreen(cliente: cliente),
                    ),
                  );
                },
              );
            },
          ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddClienteDialog,
        icon: const Icon(Icons.add),
        label: Text('Nuevo cliente'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF023B90),
      ),

      bottomNavigationBar: HotelNavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (index) => _navigateToTab(context, index),
      ),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    final screen = switch (index) {
      0 => const DashboardScreen(),
      1 => const RoomsScreen(),
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
