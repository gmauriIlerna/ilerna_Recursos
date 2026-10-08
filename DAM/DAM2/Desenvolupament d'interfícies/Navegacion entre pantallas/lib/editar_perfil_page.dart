import 'package:flutter/material.dart';

import 'perfil_datos.dart';

class EditarPerfilPage extends StatefulWidget {
  final PerfilDatos datos;

  const EditarPerfilPage({
    super.key,
    required this.datos,
  });

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  late final TextEditingController _nombreController;
  late final TextEditingController _descripcionController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.datos.nombre);
    _descripcionController = TextEditingController(
      text: widget.datos.descripcion,
    );
  }

  void _guardar() {

    final datos = PerfilDatos(
      nombre: _nombreController.text.trim(),
      descripcion: _descripcionController.text.trim(),
    );

    Navigator.pop(context, datos);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _guardar,
              child: const Text('Guardar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
