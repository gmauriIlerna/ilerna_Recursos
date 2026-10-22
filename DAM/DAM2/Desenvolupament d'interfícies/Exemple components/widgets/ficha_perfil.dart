import 'package:flutter/material.dart';

class FichaPerfil extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final IconData icono;
  final Color color;

  final VoidCallback onAccion;
  final String textoBoton;

  const FichaPerfil({
    super.key,
    required this.nombre,
    required this.descripcion,
    this.icono = Icons.person,
    this.color = Colors.blue,
    required this.onAccion,
    this.textoBoton = 'Seleccionar',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, size: 64, color: color),
        const SizedBox(height: 16),
        Text(
          nombre,
          style: const TextStyle(fontSize: 28),
        ),
        const SizedBox(height: 8),
        Text(descripcion),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onAccion,
          child: Text(textoBoton),
        ),
      ],
    );
  }
}
