import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/clientes/models/cliente.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final List<Cliente> _clientes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Buscar cliente',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          if (_clientes.isEmpty)
            const Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text('No hay clientes registrados'),
                subtitle: Text('Aquí aparecerán los clientes del hotel.'),
              ),
            )
          else
            ..._clientes.map(
              (cliente) => Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(cliente.nombre),
                  subtitle: Text('${cliente.telefono} · ${cliente.correo}'),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _mostrarFormulario,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo cliente'),
      ),
    );
  }

  void _mostrarFormulario() {
    String nombre = '';
    String numeroDocumento = '';
    String telefono = '';
    String correo = '';

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Nuevo cliente'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                onChanged: (value) => nombre = value,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número de documento',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                onChanged: (value) => numeroDocumento = value,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) => telefono = value,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => correo = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (nombre.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Escribe el nombre del cliente'),
                  ),
                );
                return;
              }

              setState(() {
                _clientes.add(
                  Cliente(
                    nombre: nombre.trim(),
                    numeroDocumento: numeroDocumento.trim(),
                    telefono: telefono.trim(),
                    correo: correo.trim(),
                    nacionalidad: '',
                  ),
                );
              });

              Navigator.of(dialogContext).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cliente agregado correctamente')),
              );
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
