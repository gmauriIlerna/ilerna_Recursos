import 'package:flutter/material.dart';

import 'editar_perfil_page.dart';
import 'perfil_datos.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _nombre = 'Alex';
  String _descripcion = 'Estudiante de DAM2';
  int _apoyos = 0;

  void _darApoyo() {
    setState(() {
      _apoyos++;
    });
  }

  void _reiniciarApoyos() {
    setState(() {
      _apoyos = 0;
    });
  }

  Future<void> _abrirEditor() async {
    final resultado = await Navigator.push<PerfilDatos>(
      context,
      MaterialPageRoute<PerfilDatos>(
        builder: (context) => EditarPerfilPage(
          datos: PerfilDatos(
            nombre: _nombre,
            descripcion: _descripcion,
          ),
        ),
      ),
    );

    if (!mounted || resultado == null) return;

    setState(() {
      _nombre = resultado.nombre;
      _descripcion = resultado.descripcion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi ficha personal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                _nombre,
                style: const TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(_descripcion, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _abrirEditor,
                child: const Text('Editar perfil'),
              ),
              const SizedBox(height: 16),
              Text('Apoyos: $_apoyos'),
              ElevatedButton(
                onPressed: _darApoyo,
                child: const Text('Dar apoyo'),
              ),
              TextButton(
                onPressed: _reiniciarApoyos,
                child: const Text('Reiniciar apoyos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
