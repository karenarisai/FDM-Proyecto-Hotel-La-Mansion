import 'package:flutter/material.dart';

class ClienteCard extends StatelessWidget {
  const ClienteCard({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    required this.onTap,
    super.key,
  });

  final String nombre;
  final String apellido;
  final String email;
  final String telefono;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0EAF5),
          child: Text(
            nombre.isEmpty ? '?' : nombre[0].toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF023B90),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        title: Text(
          '$nombre $apellido'.trim(),
          style: const TextStyle(
            color: Color(0xFF172033),
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          '$email\n$telefono',
          style: const TextStyle(
            color: Color(0xFF687384),
            fontSize: 12,
          ),
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onTap,
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: onTap,
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}