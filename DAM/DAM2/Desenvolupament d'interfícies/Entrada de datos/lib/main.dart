import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _nombre = 'Alex';
  String _descripcion = 'Estudiante de DAM2';
  int _apoyos = 0;

  final _nombreController = TextEditingController(text: 'Alex');
  final _descripcionController = TextEditingController(
    text: 'Estudiante de DAM2',
  );

  void _aplicarCambios() {
    setState(() {
      _nombre = _nombreController.text.trim();
      _descripcion = _descripcionController.text.trim();
    });
  }

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

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Mi ficha personal')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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
              Text(
                  _descripcion,
                  textAlign: TextAlign.center
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
              const SizedBox(height: 24),
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Escribe tu nombre',
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
                onPressed: _aplicarCambios,
                child: const Text('Aplicar cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
