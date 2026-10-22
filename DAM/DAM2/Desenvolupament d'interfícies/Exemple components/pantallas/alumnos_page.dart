import 'package:flutter/material.dart';
import '../widgets/ficha_perfil.dart';

class AlumnosPage extends StatefulWidget {
  const AlumnosPage({super.key});

  @override
  State<AlumnosPage> createState() => _AlumnosPageState();
}

class _AlumnosPageState extends State<AlumnosPage> {
  String _seleccionado = 'Nadie';

  void _seleccionar(String nombre) {
    setState(() {
      _seleccionado = nombre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alumnos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Text('Seleccionado: $_seleccionado'),
              const SizedBox(height: 16),
              FichaPerfil(
                nombre: 'Alex',
                descripcion: 'Estudiante de DAM2',
                onAccion: () => _seleccionar('Alex'),
              ),
              const SizedBox(height: 24),
              FichaPerfil(
                nombre: 'Sara',
                descripcion: 'Aficionada a la música',
                icono: Icons.music_note,
                color: Colors.purple,
                onAccion: () => _seleccionar('Sara'),
              ),
              const SizedBox(height: 24),
              FichaPerfil(
                nombre: 'Unai y Estel',
                descripcion: 'Estudiantes de DAM2',
                icono: Icons.home,
                color: Colors.green,
                textoBoton: 'Elegir esta ficha',
                onAccion: () => _seleccionar('Unai y Estel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
